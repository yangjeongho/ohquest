package app.madeinho.ohquest.common.util ;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.*;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;

public class ImageRender {
	public void resize(String source, String destination, int width, int height) throws IOException {
		File newFile = new File(destination);
		RenderedOp renderedOp = JAI.create("fileload", source);	
		BufferedImage bufferedImage = renderedOp.getAsBufferedImage();
		BufferedImage bufferIm = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D graphics2D = bufferIm.createGraphics();
		graphics2D.drawImage(bufferedImage, 0, 0, width, height, null);
		ImageIO.write(bufferIm, "jpg", newFile);
	}
}

