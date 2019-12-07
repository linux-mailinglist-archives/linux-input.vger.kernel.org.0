Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7F98115E7C
	for <lists+linux-input@lfdr.de>; Sat,  7 Dec 2019 21:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfLGU2e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Dec 2019 15:28:34 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42238 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbfLGU2d (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 7 Dec 2019 15:28:33 -0500
Received: by mail-pf1-f195.google.com with SMTP id 4so5131783pfz.9
        for <linux-input@vger.kernel.org>; Sat, 07 Dec 2019 12:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4hVEmqaVaStWRTWK/HVTNe3NC7PPsKVVAYHl4zLhohM=;
        b=QvAKbYhajijz97QJOf2co+5gGSKvqYmQH2P0ib+fyL67v46FmOjz7IafuXVwyisA78
         WKZzGABgvHlMzWtkPlWDcE699q6l9G4PemUhloY4hhNjJt6NMlbsbbwXaNeMUM+V7PRD
         aSsJrgFoIY1w1Xaj+bjzwiJ+rtP3Ube17ZYdc2VEXAQk3xCCQaYTV0U1yTjHGqrMEjNy
         hASKQlXQST7PLpdYje+hnhDZ7d59RpKfUUI1157QmcG0zdJIt7uLBO0DBi1H5368O/rK
         dSBrM6GU9CdblQAflEaqeql5n+WPQP5kcujKbWOY+2760WAU5LmyahTtn8BO6bIrUmOn
         1a/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4hVEmqaVaStWRTWK/HVTNe3NC7PPsKVVAYHl4zLhohM=;
        b=rnPiBT6TnmacOFkOHF2xZDNJASEpqnpNEfSgOCYENlFMbnVj4vl8Rxllbmr/mEtt8T
         M10WBj9JGh4LOU+S3KfgOVeqtZILV7DNKLRfTWvBIX7TwyKZAUXCrXe20FfL3hYXW/XM
         j9OW736tcNQ/c57j33q71oDTlHSyUMm9pA0Kd5jvU3ghtShhINNJ8vGv5pisO0Qub0n0
         DtsbJ0aLSzXLUoLkjq7a1uqjzJS7jZW6vB31j+RPAs7Inl5xtogAmsJHXfkT9gUXzLx4
         +drvr4i9Kx42jQaJd+ePEFu5lbqDjCXfn25mBOHWWZ+Fyn02w4NE49TgS8K0ICw/8wl6
         eoGQ==
X-Gm-Message-State: APjAAAV9mfQwH/a/aJEEB5yYuQr+TGCo3C0hunuVYD+UqafVJQzseR2i
        0YmQ8bnh3CvRlAxJPs4SD8Q=
X-Google-Smtp-Source: APXvYqwZhhd7dxzlJJVn6REMXV+8A6en+qW5k2Trj+XgB3BbeMYZJddPl3jYbnzPqe9hKn2Q1/BQJQ==
X-Received: by 2002:a62:7681:: with SMTP id r123mr21329372pfc.169.1575750512720;
        Sat, 07 Dec 2019 12:28:32 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id gc1sm7350279pjb.20.2019.12.07.12.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 12:28:32 -0800 (PST)
Date:   Sat, 7 Dec 2019 12:28:30 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: goodix - Add upside-down quirk for Teclast X89
 tablet
Message-ID: <20191207202830.GR50317@dtor-ws>
References: <20191202085636.6650-1-hdegoede@redhat.com>
 <99ff833f27ce999e334d43ac511b6032f2668dc6.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99ff833f27ce999e334d43ac511b6032f2668dc6.camel@hadess.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 02, 2019 at 11:16:35AM +0100, Bastien Nocera wrote:
> On Mon, 2019-12-02 at 09:56 +0100, Hans de Goede wrote:
> > The touchscreen on the Teclast X89 is mounted upside down in relation
> > to
> > the display orientation (the touchscreen itself is mounted upright,
> > but the
> > display is mounted upside-down). Add a quirk for this so that we send
> > coordinates which match the display orientation.
> > 
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Looks good
> 
> Reviewed-by: Bastien Nocera <hadess@hadess.net>

Applied, thank you.

> 
> > ---
> >  drivers/input/touchscreen/goodix.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/input/touchscreen/goodix.c
> > b/drivers/input/touchscreen/goodix.c
> > index fb43aa708660..0403102e807e 100644
> > --- a/drivers/input/touchscreen/goodix.c
> > +++ b/drivers/input/touchscreen/goodix.c
> > @@ -128,6 +128,15 @@ static const unsigned long goodix_irq_flags[] =
> > {
> >   */
> >  static const struct dmi_system_id rotated_screen[] = {
> >  #if defined(CONFIG_DMI) && defined(CONFIG_X86)
> > +	{
> > +		.ident = "Teclast X89",
> > +		.matches = {
> > +			/* tPAD is too generic, also match on bios date
> > */
> > +			DMI_MATCH(DMI_BOARD_VENDOR, "TECLAST"),
> > +			DMI_MATCH(DMI_BOARD_NAME, "tPAD"),
> > +			DMI_MATCH(DMI_BIOS_DATE, "12/19/2014"),
> > +		},
> > +	},
> >  	{
> >  		.ident = "WinBook TW100",
> >  		.matches = {
> 

-- 
Dmitry
