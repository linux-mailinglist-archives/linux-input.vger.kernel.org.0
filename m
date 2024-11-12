Return-Path: <linux-input+bounces-8036-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD03F9C5762
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 13:12:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A25C1B249C3
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 11:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0061BB6B5;
	Tue, 12 Nov 2024 11:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0pLP32P"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4132309A9;
	Tue, 12 Nov 2024 11:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731412398; cv=none; b=AJeLx5uJlQ/LAh3kp+d70gSjafc9DAMkM3DhxVts1Pzo8Ou7DKewQfTXJA957G4v5KnF9drqNFHQiKrUc6JmxHCB3x+IDSFYW31Rr66BWN3hdsXPcTztxqQT25aDR3NnrkFwzqNHuwPTjgQdL+8kEIgo8+xBSv3DioXllNi21QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731412398; c=relaxed/simple;
	bh=TnqPipQg2CpmZLQ4wcu28TkzNcF6HV7w2kDzb759YOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ytt9CWF3rAoHWeOMBfjkZ4T2XCqLQ9TxLqe+eVeY+TSnu/U/GxhPKccVQSlzMc8Te1bOmodiZlyitQKVGYrj35NghC5p2ls24SLne0wxt9CLjT+32h3MmD4DRki+B/1bJSWSuvAS+99o66MQ8pgABZlpCf4mcYqtxQPj/KFs5DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0pLP32P; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7ee11ff7210so4149882a12.1;
        Tue, 12 Nov 2024 03:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731412396; x=1732017196; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=77BPT0TV3A11R+sNVa9I1JVGIl/YUnzmNjHt+0y5/uY=;
        b=f0pLP32P6GFCHKpHjWzUNp1pHX+tefhqniTl0vhhXrKDgCSF4q5UsisUZmiApcnQBT
         PQA74EQTv4IF3ThnX4/PILbBYcNyw+//4xYJzuWmj/dWIaHW7mkyXTLDgi5NOw7+Lo6w
         nwT0PpzGyx/spzpveRFh3Gr51FjQhQYOyH+etVLK4K6mC2p5fWEHUEo779QeVR8rBTci
         2lhlzmb7Yzz5IiGPiJ+g5y4aoCDIIj4nxxvVqfFNI6HFn3YQB3TM5HJ9YGNfQ7m0ATXE
         VGyxvDSUyYp40wtzojLqrrjQCVjmDyHo4vQDwXyrRfdu4RIiX3Ngnoo0OqXReI2u5DAN
         DTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731412396; x=1732017196;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77BPT0TV3A11R+sNVa9I1JVGIl/YUnzmNjHt+0y5/uY=;
        b=kHh9QlV6bEFu2E7kiy/GXTOJJF38YQEMqdUG2h6fhIFjsy0exib8cApl/fOxn9gi+W
         ifTZEzIxmFawk1w6/cg0sQ4cc7HKmwm3ffKXpCcBTqZ0bNeWLdMVUJC1Q6KLlsDVy0JZ
         HgPQw5WDn7fJ46P2Nayzmoq8toaU+oh88kzYx1mnHsq5mR6QBIaSAE43gSVkN9cuAx/o
         tO+znRwQ0bcD2KS669qgAH67Lu2iO1FVlv7gIvyrGeg30GbU9ZrlhLglIbWR5PxWGyrG
         O8W/rloqM4K7tZCzL7bLNu2ky3opZJoZtLW4TjhihT/sAkbxIm2QX8WHqEwNlIu1D6Ha
         0Cyg==
X-Forwarded-Encrypted: i=1; AJvYcCUZT53bF+NGCXRZz+x+jpQNETdP7d7FklWvVYyAZtHplsqYGoO2At0mPBl4qsnrPQcddOoIqXCL7vwGsT0p@vger.kernel.org, AJvYcCVKaNT5gzaKqjU7CjNXafGKyW03WB8FQCh7TTezr0pNViwL069BPZ23Yxh0qRCbEzqGsplpt+gGTiJzA3c=@vger.kernel.org, AJvYcCVeeOsJioq+uBWAoeAOlX9LElLZXmy51wBZdrJjrOAAFIrWuvLtPCkuwD5jyiG7o9p9O96dAezdkfZs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3TD1OaqY//AvnxVaSmz+vfZWQ5G9Sl88MCkny9l8GLB4RlK/A
	0AfYiPDB6x3PZ7q2NGe1ZV0lCxTtu+jP6B9Z671BHn/ew2VVJqh1
X-Google-Smtp-Source: AGHT+IGMAZvN6QZA0lKlxIqEWgUYkYo2wgb3l4Uv9em6gzdM5DvG1g7/whPF59nG27HiAoRwyRtHrg==
X-Received: by 2002:a17:90b:2ece:b0:2e2:d33b:cc with SMTP id 98e67ed59e1d1-2e9b172e0bemr21513271a91.21.1731412396371;
        Tue, 12 Nov 2024 03:53:16 -0800 (PST)
Received: from ux-UP-WHL01 (mailgw01.gttektw.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9b50dcd9bsm8080210a91.21.2024.11.12.03.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 03:53:15 -0800 (PST)
Date: Tue, 12 Nov 2024 19:53:10 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: robh@kernel.org, krzk@kernel.org, hbarnor@chromium.org,
	conor.dooley@microchip.com, dmitry.torokhov@gmail.com,
	jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] HID: hid-goodix: Add OF supports
Message-ID: <ZzNBpkwDLgutPJq8@ux-UP-WHL01>
References: <20241111075000.111509-1-charles.goodix@gmail.com>
 <20241111075000.111509-3-charles.goodix@gmail.com>
 <CAD=FV=WKU2Wwfwg1EACYgJtUKJjYH2OOQn6ELXbBK=B-jzbTZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WKU2Wwfwg1EACYgJtUKJjYH2OOQn6ELXbBK=B-jzbTZQ@mail.gmail.com>

Hi Doug,

On Mon, Nov 11, 2024 at 09:24:39AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Sun, Nov 10, 2024 at 11:50 PM Charles Wang <charles.goodix@gmail.com> wrote:
> >
> > This patch introduces the following changes:
> > - Adds OF match table.
> > - Hardcodes hid-report-addr in the driver rather than fetching it
> >   from the device property.
> >
> > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > ---
> >  drivers/hid/hid-goodix-spi.c | 17 +++++++++++------
> >  1 file changed, 11 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/hid/hid-goodix-spi.c b/drivers/hid/hid-goodix-spi.c
> > index 6ae2300a6..80c0288a3 100644
> > --- a/drivers/hid/hid-goodix-spi.c
> > +++ b/drivers/hid/hid-goodix-spi.c
> > @@ -20,6 +20,7 @@
> >  #define GOODIX_HID_REPORT_DESC_ADDR    0x105AA
> >  #define GOODIX_HID_SIGN_ADDR           0x10D32
> >  #define GOODIX_HID_CMD_ADDR            0x10364
> > +#define GOODIX_HID_REPORT_ADDR         0x22C8C
> >
> >  #define GOODIX_HID_GET_REPORT_CMD      0x02
> >  #define GOODIX_HID_SET_REPORT_CMD      0x03
> > @@ -701,12 +702,7 @@ static int goodix_spi_probe(struct spi_device *spi)
> >                 return dev_err_probe(dev, PTR_ERR(ts->reset_gpio),
> >                                      "failed to request reset gpio\n");
> >
> > -       error = device_property_read_u32(dev, "goodix,hid-report-addr",
> > -                                        &ts->hid_report_addr);
> > -       if (error)
> > -               return dev_err_probe(dev, error,
> > -                                    "failed get hid report addr\n");
> > -
> > +       ts->hid_report_addr = GOODIX_HID_REPORT_ADDR;
> >         error = goodix_dev_confirm(ts);
> >         if (error)
> >                 return error;
> > @@ -790,6 +786,14 @@ static const struct acpi_device_id goodix_spi_acpi_match[] = {
> >  MODULE_DEVICE_TABLE(acpi, goodix_spi_acpi_match);
> >  #endif
> >
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id goodix_spi_of_match[] = {
> > +       { .compatible = "goodix,gt7986u-spifw", },
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(of, goodix_spi_of_match);
> > +#endif
> > +
> >  static const struct spi_device_id goodix_spi_ids[] = {
> >         { "gt7986u" },
> >         { },
> > @@ -800,6 +804,7 @@ static struct spi_driver goodix_spi_driver = {
> >         .driver = {
> >                 .name = "goodix-spi-hid",
> >                 .acpi_match_table = ACPI_PTR(goodix_spi_acpi_match),
> > +               .of_match_table = of_match_ptr(goodix_spi_of_match),
> 
> I can never quite remember what the current preference is in regards
> to "OF" tables (whether to use #ifdef like you've done or mark them
> `__maybe_unused`), so maybe someone will request you change it. ...but
> IMO what you have is fine and looks to be properly guarded with
> of_match_ptr(). As far as I'm concerned, this patch looks OK.
> 
> Oh, I guess the one "nit" is that I would have put "spi" in the
> subject, making it "HID: hid-goodix-spi: Add OF supports". It might be
> worth sending a v5 for that (after waiting a day or two) unless a
> maintainer tells you not to.
>

Ack,

> In any case:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks,
Charles

