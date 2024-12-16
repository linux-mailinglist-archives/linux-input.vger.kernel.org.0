Return-Path: <linux-input+bounces-8606-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A3A9F372E
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 18:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7110216A5DB
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 17:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B195020629F;
	Mon, 16 Dec 2024 17:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYFzKF/A"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC04214D2A2;
	Mon, 16 Dec 2024 17:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734369295; cv=none; b=jgJAWXf8exhA45nd6Oj8iJKY4mHTNvaJ2IU4Ii0m5PyWJtMyJXcIudDBVVKMcTlywh/HvtyYkizjSib41cBUBwHpR5sFVWM1D3iZV+bkHa6gllvAq/7oSctVxWS+1j4lWJXvy+fhbZO67oJ7ZP/D2lZjneyRqLfc+TKArS8sYRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734369295; c=relaxed/simple;
	bh=zn3zIjBvSwRghREDup/xO5OCc4OaGObSpmbwEn0SNaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLxkbrrtDmZ9hvFlgLx0MzXmRzlJ/JSa3tsLn0Pz8VCtwRo0ljIf4rf2lFUhLVwYwbqRXIF/YnEJrLbHPalRuFx+BUaUkELzDgTAtDt84X2DIri4+8s7mZElEXmpFfSWcRIXbf4qz38njf/2oEAKGgrptLBI3ljV6RdouVCyO5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYFzKF/A; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fd526d4d9eso3377997a12.2;
        Mon, 16 Dec 2024 09:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734369292; x=1734974092; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lRSt1oLHA0zTODMJmMWpU6xidSXKF2EyOx2XJ0WYI9g=;
        b=PYFzKF/ANFcgfJmAuvKOVwrvclSw40J27uMLi4OnXmjSbNb/tJujGKfubc92Ynge1m
         CgWrC2ny1sVFDWhJhJOlvK/uVVhejE4FmyiiEmRsqbrOCXC2gMmZKsGkaPBA4fMi60yx
         CFWrWcvoVCaCsxJhG2NqD0I7b8rPuOUluqnNk2LEihhYW38zeSHMrLk2WUJ72nsc5eAH
         K0VK3+X/i1N+b8pcvgYZGwqRzy8cp+v4tn1UNtda97h98UvYD+7aCxULV9/TsWZRWrGY
         +tuLSTnTEMOY2/mi/z5pun9lJ/O/LHmOhQkr6ETmZQTCHoK5JiMv0doVIL3OytUEnk8L
         GyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734369292; x=1734974092;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lRSt1oLHA0zTODMJmMWpU6xidSXKF2EyOx2XJ0WYI9g=;
        b=PN7mxEvWGN8B8JTX7knEXjG8qaKQE8xMVkc4bWOOvgFITINNvpyiOmLxYuRXdL/M+P
         E79KgEC8SfNB8Fe2KxzNXqYOB3T53RpYMNtV41CkbOLlAiV7N5n/aw4ePEBWGbVJ0F09
         yLxyVdISsACT3Al3S0wb1M1xeaICfby0OP/gy0m56hIccYDmCHNcHYxbtc9iVdaaZowk
         eyMxf+VMJLvYkPp+LTMHmQXLv5Zaaz51USoP1Iwki/Jn08Yb+lkS5CLPfZyESsvQsKTQ
         b0KqXiwMQb9x5rYMHdPRqKt4HwDU4UvsdqxWAlqJSrrKONHIyPtdvoVPGQkARHRgW2hE
         0ATA==
X-Forwarded-Encrypted: i=1; AJvYcCWo4NVPnEchvyNG2ed1ludpUnbMdTjCDefVGQoRP5CQT4KDKhXyJZ0qn3WuiQ5IB1qqOVZwwvn2G3v5upQo@vger.kernel.org, AJvYcCWyOw4jr/1qhQtfjNqHSpotNt3yDLrpUuUaQm9EcS9SVlN698hsoy7jypFnUz0jvR867ZCZS7FvcPesHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzslNzZJNPLyT1NMCoIGeUbV3NWxxvcRbFusZxWSukWVAzB1GG3
	xiY8l4o636DbIFgR7D4N565SqzauwFZDun756M3N/e/+zc7q4ChF
X-Gm-Gg: ASbGncvtYMtfOabNH9X6VbFdhHOHC31kEodTUY1EMHyyRsZP98HZ+Ja/zAj5Pml2WKD
	0uj6rxgTqoDAGIjo1xYzTEu33Xw1nRBg0cf8GSGyvd+teayo+na+Wwx6afRIlUN8DsuTMXWZeyN
	GUhc3washpdN2nE74uD/kqQQ8gKOK9Dmwm1ieRAzcfM4odrBLIp96I/JPEkABo8vv0IvGhSnTLE
	giy5+H1iLqv1cyj3fw8N2QyWdfBm4W8cQchIErH2L5yCjWUQNIYswftVQ==
X-Google-Smtp-Source: AGHT+IGV0uc9TXAotb6SVuWf7nwmp5/mTbhYXT4dFXmqRcyoiJbbZ7KHFY3NKQN1g7dRKFUEA+vrxQ==
X-Received: by 2002:a17:90b:3e88:b0:2ea:5054:6c49 with SMTP id 98e67ed59e1d1-2f28f8691ebmr22339295a91.0.1734369291762;
        Mon, 16 Dec 2024 09:14:51 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:e6c1:cee8:7b58:a395])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2a24349b5sm4963932a91.40.2024.12.16.09.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:14:51 -0800 (PST)
Date: Mon, 16 Dec 2024 09:14:48 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Luwei Zhou <b45643@freescale.com>,
	Vipul Kumar <vipul_kumar@mentor.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] input: mma8450: Add chip ID check in probe
Message-ID: <Z2BgCC8hPyaAxhOL@google.com>
References: <20241213222310.189443-1-Frank.Li@nxp.com>
 <bzzzezoon5u5pufpbkn3fnm2dtbrzatx4w4tbdstcdmowvfzzn@cplbmxtgmu6z>
 <Z2BVlyV8o1dkBUq2@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2BVlyV8o1dkBUq2@lizhi-Precision-Tower-5810>

On Mon, Dec 16, 2024 at 11:30:15AM -0500, Frank Li wrote:
> On Sat, Dec 14, 2024 at 12:02:56AM +0100, Uwe Kleine-König wrote:
> > Hello Frank,
> >
> > On Fri, Dec 13, 2024 at 05:23:09PM -0500, Frank Li wrote:
> > > From: Luwei Zhou <b45643@freescale.com>
> > >
> > > Prevent continuous polling error logs by adding a chip ID check in the
> > > probe  function. This ensures the driver only proceeds when the mma8450 is
> > > present, avoiding issues in scenarios like missing add-on cards.
> > >
> > > Signed-off-by: Luwei Zhou <b45643@freescale.com>
> > > Signed-off-by: Fugang Duan <B38611@freescale.com>
> > > Signed-off-by: Vipul Kumar <vipul_kumar@mentor.com>
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/input/misc/mma8450.c | 16 +++++++++++++++-
> > >  1 file changed, 15 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/input/misc/mma8450.c b/drivers/input/misc/mma8450.c
> > > index 08412239b8e69..da941748ed29b 100644
> > > --- a/drivers/input/misc/mma8450.c
> > > +++ b/drivers/input/misc/mma8450.c
> > > @@ -38,6 +38,8 @@
> > >
> > >  #define MMA8450_CTRL_REG1	0x38
> > >  #define MMA8450_CTRL_REG2	0x39
> > > +#define MMA8450_ID		0xc6
> > > +#define MMA8450_WHO_AM_I	0x0f
> > >
> > >  static int mma8450_read(struct i2c_client *c, unsigned int off)
> > >  {
> > > @@ -148,8 +150,20 @@ static void mma8450_close(struct input_dev *input)
> > >   */
> > >  static int mma8450_probe(struct i2c_client *c)
> > >  {
> > > +	struct i2c_adapter *adapter = to_i2c_adapter(c->dev.parent);
> >
> > +	struct i2c_adapter *adapter = c->adapter;
> >
> > >  	struct input_dev *input;
> > > -	int err;
> > > +	int err, client_id;
> > > +
> > > +	err = i2c_check_functionality(adapter,
> > > +				      I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_BYTE_DATA);
> > > +	if (!err)
> > > +		return err;
> >
> > How unusual. I would have expected no ! here.
> 
> yes, it should be better
> 
> 	if (!i2c_check_functionality())
> 		....
> 
> i2c_check_functionality() return 1 if adapter supports everything we need.

Yes, it would be much better, otherwise in the case when an adapter does
not support the required functionality your code returns 0 which signals
successful probing.

Thanks.

-- 
Dmitry

