Return-Path: <linux-input+bounces-12059-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2F6A9FF0E
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 03:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07BFA17FEC8
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 01:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB972AE8C;
	Tue, 29 Apr 2025 01:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chkyPS+C"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD671EEE9;
	Tue, 29 Apr 2025 01:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745890249; cv=none; b=S+ufQUN0vxe7/lJhEAOozIupP24CGXBfGxT1TrZ7Qvhjf3BZ2Z7BVSXgokvRw0Kz0z38IEBGTlf3ZxGCB9JZKsTHAnc0p4BFHYfP2VRjLSSMG2V9fJ84aHHdlgg12vUDHocnu8KP1quVu9/uCdmR3RZzLYPTaUoIub3JB7L1ym4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745890249; c=relaxed/simple;
	bh=TVnjXJY/5YEyjEuqQ9cbvvOwbxBS2eUJ/uK58mDjbkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdoK5KUcEEyq//CMUNALrLx5zch7mARF1qn20J1WLxLQspjWtSfC1dIMdvSsCgcTavWiAuJ4U2RG5sLZaWp0/ClN4o182i2Y0DKg5QoL1Sj+UOqOz2I/hFR7z2Fwt69TmzvBnsgy14+PFVf8TXQ/7e+OPKkHFc2AL/J1bUPU1Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chkyPS+C; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22c336fcdaaso64492445ad.3;
        Mon, 28 Apr 2025 18:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745890247; x=1746495047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TzQm8A87v9ZYEXZ0cTVjUo2SmrD/iQja2lExXekG3hU=;
        b=chkyPS+CoYMmLGGEUDqH5j/B/LYLoxqX9hFT/02n9c13opUj1OyWsL0UbzJisALD2l
         LC0jxePQFTcBnzivgh+3DD2mZArzafF/dkWA3UAdHVibqB756Nt+KnCi4tvPHAkNfznj
         C1u3cOnRgv6QW9nTShgQp+tn40KeMDbmrdIQvaQBrrrfSFH5uhWbZ2+9XfllarXcm689
         BcLmroGPmiZ/gX1xdhurD4KXp8BbWXyiLo1Yptx8yUqO8WlW8JiotpK4H9RLz8awYVcK
         EPuvR/n7LIhp+ih9nNxLdEkTQNe0SUTgnTx+74Jp1HdbbjY/2+ihXyddehiGy5WKNFsY
         NgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745890247; x=1746495047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzQm8A87v9ZYEXZ0cTVjUo2SmrD/iQja2lExXekG3hU=;
        b=HWlSH9BLxyjHXvbtKUzNMHtFNwq1zhqWk9gnlIAsfbxE9a20sslRZcpHqkaQbu5gYI
         U82J4XY9phDmxhnYoz75SgwGKad+hpD/JZmo40M2CL8MM5Ck4i54PBBk72TwwG8UXWR5
         4Rzw+VsznebpkCV2XyHlxsPtuLb/RHPF+Go0c5sXlbF2ld6W3Z9ihwuJ+EYSFE3DVOIh
         2kbHt4uVlHGw34S8kohqfPdsIo47Oj4Be/dQNlxEhaxYUCxOHeNeWLTqYhmWwFD1DmD9
         k+odmvsW27vH5MlRc+EWhk2mvvER+S06Wtasd4b2O8nBVye6Kr4p5RwKXZYeKeHR4Eh0
         5p9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4K+w1gTSeLXhCrovhLDk8MedW1f1OwFYsL1N/hsILfKT3i/NWUK1sbzdP/Z+HQ4ves5O+YjlKoLrw+5KS@vger.kernel.org, AJvYcCXb/wBTW1YIuTyvIRaN+iJ0aRRLWeqx8pD73+Q+MtSAD0eHqbGBZ8OudeWx1rmsE642iPw7FFkkV30D4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6wsh2G4pepMEeTAcdas34M3MLpOfO0spSwGDyMw109eSz3m5F
	Six/9WLWf1bOpQZUOmojBdOEnx3st6gmcdunkpETMCh1sxMeSJ6yLbluEA==
X-Gm-Gg: ASbGnctPcIUYNHEEEVMW+PYLPe4LhcglHYz08QGi9i2aXA5gNkWaKZ3qJW7LScnYoSu
	F1fRUWVshiscdAIqssmxKSmT981r4QsVn7MmMMoA8oWoEcrge/6l1WgQJCqtWuLRS93g0JT+e8D
	EO6UGFqOSKdqAmSpsRRkqxSKgcr5OxjgGhyvz3ijlEChdBqSvwpwR2Gvtn0RMzIm0ol8Twqy9pu
	KqJYw1NMgAdSJj/mgWHMEkLLxg202NiSu0MzopRMwpM5ZyarwnXiu9SH9jgdF0hkDGI+48XvGAm
	ZresnOfPk1UmpoMfJTIQmwlRtI2iUt2YIOoUoGh7MA==
X-Google-Smtp-Source: AGHT+IH1mqd2XbITilL5ZwpvhhybEgQTmWvSDIRnPa9DBoDeNpO7I7rVHVSnw33KrSxPB5iiAwXesQ==
X-Received: by 2002:a17:902:ec89:b0:224:162:a3e0 with SMTP id d9443c01a7336-22de6083764mr25066295ad.49.1745890247197;
        Mon, 28 Apr 2025 18:30:47 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:adc2:8397:4f51:d5a0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e87d5sm90152145ad.118.2025.04.28.18.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 18:30:46 -0700 (PDT)
Date: Mon, 28 Apr 2025 18:30:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: Purva Yeshi <purvayeshi550@gmail.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: iqs5xx: Fix incorrect argument passed to hex2bin
Message-ID: <7dlagq4wtypyx7uvcmfhrbs6pch57behhkmjpqwt35qxaz2zhv@pqhm3ulnkslw>
References: <20250419200434.39661-1-purvayeshi550@gmail.com>
 <aAQiH1DnDXRcRsya@nixie71>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAQiH1DnDXRcRsya@nixie71>

On Sat, Apr 19, 2025 at 05:22:23PM -0500, Jeff LaBundy wrote:
> Hi Purva,
> 
> On Sun, Apr 20, 2025 at 01:34:34AM +0530, Purva Yeshi wrote:
> > Fix Smatch-detected issue:
> > drivers/input/touchscreen/iqs5xx.c:747 iqs5xx_fw_file_parse()
> > error: hex2bin() 'rec->len' too small (2 vs 4)
> > 
> > Fix incorrect second argument to hex2bin() when parsing firmware records.
> > 
> > Pass a pointer to the ASCII hex data instead of the u8 record length to
> > hex2bin(), which expects a pointer, not an integer. The previous code
> > passed rec->len as the second argument, leading to undefined behavior
> > as hex2bin() attempted to read from an unintended memory address.
> > 
> > Cast the entire rec structure to a const char * using a new pointer
> > rec_bytes. Skip the initial ':' character in the Intel HEX format by
> > passing rec_bytes + 1 to hex2bin(). This allows the function to decode
> > the 4-byte record header (length, address high, address low, and type)
> > correctly from its ASCII hex representation into binary form.
> > 
> > Preserve the original code flow while ensuring correctness and resolving
> > the issue detected by Smatch.
> > 
> > Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> > ---
> >  drivers/input/touchscreen/iqs5xx.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
> > index 4ebd7565ae6e..e8140a54685f 100644
> > --- a/drivers/input/touchscreen/iqs5xx.c
> > +++ b/drivers/input/touchscreen/iqs5xx.c
> > @@ -744,7 +744,9 @@ static int iqs5xx_fw_file_parse(struct i2c_client *client,
> >  			break;
> >  		}
> >  
> > -		error = hex2bin(rec_hdr, rec->len, sizeof(rec_hdr));
> > +		const char *rec_bytes = (const char *)rec;
> > +
> > +		error = hex2bin(rec_hdr, rec_bytes + 1, sizeof(rec_hdr));
> > +
> >  		if (error) {
> >  			dev_err(&client->dev, "Invalid header at record %u\n",
> >  				rec_num);
> > -- 
> > 2.34.1
> > 
> > 
> 
> Thank you for the patch! I appreciate your having investigated this
> warning, but this patch is a NAK. I can't speak to why Smatch thinks
> there is a problem here, but we can see from the definition of the
> struct 'iqs5xx_ihex_rec' that 'len' is indeed a pointer:
> 
>         char len[2];
> 
> I also checked with actual HW on latest kernel that FW updates still
> work just fine. The following line ensures we are looking at a valid
> memory location when locating the 'src' pointer:
> 
>         rec = (struct iqs5xx_ihex_rec *)(fw->data + pos);
> 
> In case I have misunderstood, please let me know.

Right, I think the original submitter misread the code. However I find
the code a bit hard to follow with only some fields of iqs5xx_ihex_rec
being used directly and accessed spilling over to others.

I wonder if something like below will not make it easier to read...

Thanks.

-- 
Dmitry

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 5b0c14ca2489..26aeb4a8ccde 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -72,7 +72,9 @@
 #define IQS5XX_CSTM_LEN		(IQS5XX_PMAP_END + 1 - IQS5XX_CSTM)
 #define IQS5XX_PMAP_LEN		(IQS5XX_PMAP_END + 1 - IQS5XX_CHKSM)
 
-#define IQS5XX_REC_HDR_LEN	4
+#define IQS5XX_REC_HDR_LEN_HEX	(1 /* start */ + 2 /* size */ + \
+				 4 /* addr */ + 2 /* type */)
+#define IQS5XX_REC_HDR_LEN	4 /* size + addr (2 bytes) + type */
 #define IQS5XX_REC_LEN_MAX	255
 #define IQS5XX_REC_TYPE_DATA	0x00
 #define IQS5XX_REC_TYPE_EOF	0x01
@@ -97,14 +99,6 @@ struct iqs5xx_dev_id_info {
 	u8 bl_status;
 } __packed;
 
-struct iqs5xx_ihex_rec {
-	char start;
-	char len[2];
-	char addr[4];
-	char type[2];
-	char data[2];
-} __packed;
-
 struct iqs5xx_touch_data {
 	__be16 abs_x;
 	__be16 abs_y;
@@ -696,7 +690,6 @@ static irqreturn_t iqs5xx_irq(int irq, void *data)
 static int iqs5xx_fw_file_parse(struct i2c_client *client,
 				const char *fw_file, u8 *pmap)
 {
-	struct iqs5xx_ihex_rec *rec;
 	size_t pos = 0;
 	int error, i;
 	u16 rec_num = 1;
@@ -723,25 +716,25 @@ static int iqs5xx_fw_file_parse(struct i2c_client *client,
 	}
 
 	do {
-		if (pos + sizeof(*rec) > fw->size) {
+		if (pos + IQS5XX_REC_HDR_LEN_HEX > fw->size) {
 			dev_err(&client->dev, "Insufficient firmware size\n");
 			return -EINVAL;
 		}
-		rec = (struct iqs5xx_ihex_rec *)(fw->data + pos);
-		pos += sizeof(*rec);
 
-		if (rec->start != ':') {
+		if (fw->data[pos] != ':') {
 			dev_err(&client->dev, "Invalid start at record %u\n",
 				rec_num);
 			return -EINVAL;
 		}
 
-		error = hex2bin(rec_hdr, rec->len, sizeof(rec_hdr));
+		/* Convert all 3 fields in one go */
+		error = hex2bin(rec_hdr, &fw->data[pos + 1], sizeof(rec_hdr));
 		if (error) {
 			dev_err(&client->dev, "Invalid header at record %u\n",
 				rec_num);
 			return error;
 		}
+		pos += IQS5XX_REC_HDR_LEN_HEX;
 
 		rec_len = *rec_hdr;
 		rec_addr = get_unaligned_be16(rec_hdr + sizeof(rec_len));
@@ -751,22 +744,22 @@ static int iqs5xx_fw_file_parse(struct i2c_client *client,
 			dev_err(&client->dev, "Insufficient firmware size\n");
 			return -EINVAL;
 		}
-		pos += (rec_len * 2);
 
-		error = hex2bin(rec_data, rec->data, rec_len);
+		error = hex2bin(rec_data, &fw->data[pos], rec_len);
 		if (error) {
 			dev_err(&client->dev, "Invalid data at record %u\n",
 				rec_num);
 			return error;
 		}
+		pos += rec_len * 2;
 
-		error = hex2bin(&rec_chksm,
-				rec->data + rec_len * 2, sizeof(rec_chksm));
+		error = hex2bin(&rec_chksm, &fw->data[pos], sizeof(rec_chksm));
 		if (error) {
 			dev_err(&client->dev, "Invalid checksum at record %u\n",
 				rec_num);
 			return error;
 		}
+		pos += 2;
 
 		chksm = 0;
 		for (i = 0; i < sizeof(rec_hdr); i++)


