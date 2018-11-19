package com.l2r.lucene;

import java.io.StringReader;
import java.nio.file.Paths;
import java.util.LinkedList;
import java.util.List;

import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Fragmenter;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.search.highlight.SimpleSpanFragmenter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import com.l2r.entity.Blog;
import com.l2r.util.StringUtil;

public class BlogIndex {


		private Directory dir;

		private IndexWriter getWriter()throws Exception{
			dir=FSDirectory.open(Paths.get("C://lucene"));
			SmartChineseAnalyzer analyzer=new SmartChineseAnalyzer();
			IndexWriterConfig iwc=new IndexWriterConfig(analyzer);
			IndexWriter writer=new IndexWriter(dir, iwc);
			return writer;
		}
		
		public void addIndex(Blog blog)throws Exception{
			IndexWriter writer=getWriter();
			Document doc=new Document();
			doc.add(new StringField("id",String.valueOf(blog.getId()),Field.Store.YES));
			doc.add(new TextField("title",blog.getTitle(),Field.Store.YES));
			writer.addDocument(doc);
			writer.close();
		}
		
		public void deleteIndex(String blogId)throws Exception{
			IndexWriter writer=getWriter();
			writer.deleteDocuments(new Term("id",blogId));
			writer.forceMergeDeletes(); 
			writer.commit();
			writer.close();
		}
		
		public void updateIndex(Blog blog)throws Exception{
			IndexWriter writer=getWriter();
			Document doc=new Document();
			doc.add(new StringField("id",String.valueOf(blog.getId()),Field.Store.YES));
			doc.add(new TextField("title",blog.getTitle(),Field.Store.YES));
			writer.updateDocument(new Term("id",String.valueOf(blog.getId())), doc);
			writer.close();
		}
		
		public List<Blog> searchblog(String q)throws Exception{
			dir=FSDirectory.open(Paths.get("C://lucene"));
			IndexReader reader=DirectoryReader.open(dir);
			IndexSearcher is=new IndexSearcher(reader);
			BooleanQuery.Builder booleanQuery=new BooleanQuery.Builder();
			SmartChineseAnalyzer analyzer=new SmartChineseAnalyzer();
			QueryParser parser=new QueryParser("title", analyzer);
			Query query=parser.parse(q);
			
			booleanQuery.add(query, BooleanClause.Occur.SHOULD);
			
			TopDocs hits=is.search(booleanQuery.build(), 100);
			QueryScorer scorer=new QueryScorer(query);
			Fragmenter fragmenter=new SimpleSpanFragmenter(scorer);
			SimpleHTMLFormatter simpleHTMLFormatter=new SimpleHTMLFormatter("<b><font color='red'>", "</font></b>");
			Highlighter highlighter=new Highlighter(simpleHTMLFormatter, scorer);
			highlighter.setTextFragmenter(fragmenter);
			
			List<Blog> blogList=new LinkedList<Blog>();
			for(ScoreDoc scoreDoc:hits.scoreDocs){
				Document doc=is.doc(scoreDoc.doc);
				Blog blog=new Blog();
				blog.setId(Integer.parseInt(doc.get("id")));
				String title=doc.get("title");
				if(title!=null){
					TokenStream tokenStream=analyzer.tokenStream("title", new StringReader(title));
					String hTitle=highlighter.getBestFragment(tokenStream, title);
					if(StringUtil.isEmpty(hTitle)){
						blog.setTitle(title);
					}else{
						blog.setTitle(hTitle);
					}
				}
				
				blogList.add(blog);
			}
			return blogList;
		}
}
