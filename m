Return-Path: <linux-input+bounces-3719-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB158C6EA4
	for <lists+linux-input@lfdr.de>; Thu, 16 May 2024 00:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FFD41F217EE
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2024 22:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F1715B570;
	Wed, 15 May 2024 22:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgvxrlMG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D05B3BBEA;
	Wed, 15 May 2024 22:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715812113; cv=none; b=GAaRgwked6lFEcrDctoBjMoENcn0ShhOoXine55+Pj3u/DKu13yRaf34Pbo17T4gKSsqXOmnx54qmfje3/vRPVPE8FId21ZPOY2HOiANTW5gYWobf2WdntTh2TYIYlxxiC9hCMrt4uWcSLNF1Q6CByMUEJSdNDGmKJiWbzIqKJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715812113; c=relaxed/simple;
	bh=mzkAMSLVqIeTuyX+vOb9LV2TWKcEXh/UggEIG2rcKdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkbGQlm4YJdXwjdnpma0JN4+y3HrreS1mB9ImoWBqidZGqNeBmxmGigyv5W6I6lwuWz4hL6D6VwyZ5xh3Po+DHJfdGqxY9RQiP/rNeyTJAhzNdHsf6zpRvIp4ixej7tRdlk1xSrLjm0OZkbmg9U8XtXVDe45i4aZnHiBlCG61yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgvxrlMG; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-61af74a010aso72294637b3.0;
        Wed, 15 May 2024 15:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715812110; x=1716416910; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kdMw5X3KFipEQ61Vn8kLgPxPuKf/WZpCFBooeY6ws8k=;
        b=XgvxrlMGGjy7KgHpW6bdlv7nJ4YrKXiYQ4Qy7jpUfuG5NeB+fvRL8hq1RQr+gyqc2f
         ZmcojE7bPl7r4pQ+4F2Nf2TxBrV38LJbLmUc6HfB0Uwj60pgCaRfidy/u4+F6MTi66If
         G91sIYfVGpIyb40l1aANo197hjXwyd2Np/O18+8IHjduUJXh9KYrhZsCinE+r4mnF5qX
         tC/2SXHSJKGpC6NkSBtUMQHOuoQ/m0AL2TlxpCfKwq1Xs+bQsK82jk8Vf3O8U+mxu1rn
         Jned3oizEflf5xZ2WEmXasHx2jbMUh8Zc9O/UxBGq74YYR2jAAeGtAPHWkQIGnKVJgzI
         gM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715812110; x=1716416910;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdMw5X3KFipEQ61Vn8kLgPxPuKf/WZpCFBooeY6ws8k=;
        b=It0XAiqiNcwcZYDbLPGD3x32ZgzBpn0brfg9W1WcUIzCLA8sbEAatPZLhaGPPLUIT7
         Zvw8mAPHjzOGKKusDhaJoWV2pIlHySR7Ctdci5pqlQH0AmEUHLazvKAgb/310uzfTNM4
         ypio3qGAv87Qk9cbHzYYVTuHZBv41gfvdTKUJZmv0fA4SeyllUJwuyX32Oka0Fi30BhH
         kZsRV7wso4R8jZYLNHZMpVzu+Ao7NHCdJmmV7AXXry1KIpw7cnsetUFt0O8rDbQZvEvA
         4dpkh/oc0KHVwcHEvPOBDqnOtwrsToi731fESwH8VgIers2KU/ir4LttgRxkeB7hZFF4
         mPLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWeOcTRwT81SPXU18BOz6TZtP/TKzOQjduumZKSI/83FUExSyQ0aWbaY5uuhqMxCS0/i5j+BNjxtnOrwx3euG/LqRnwnGZPp+xWkiseSlu1JmfyVg5WNHuwef1IjGJbtcazZuvp15r0QA=
X-Gm-Message-State: AOJu0YyzvOj1d6Gueum7jJZnunRZ7ZNz4A4mar42oAAeQajRZ5998kOV
	Mm5Des+Dkt5LKAuLllU53FMlArOmWD82XuFb/7Dj4VCnIkNXTxKQ
X-Google-Smtp-Source: AGHT+IGTZjkxjUPXSiCqr+wEY7TurG4/BwWZVp2q4oDdgK7nSH4yNae+6cqSQvEd4RALxq5gmIrndA==
X-Received: by 2002:a05:690c:f05:b0:617:c9b0:dd9a with SMTP id 00721157ae682-622affa8c13mr204447387b3.18.1715812110295;
        Wed, 15 May 2024 15:28:30 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fcda:ecd9:1b3f:e64a])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e381afdsm31353057b3.127.2024.05.15.15.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 15:28:29 -0700 (PDT)
Date: Wed, 15 May 2024 15:28:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Denose <jdenose@google.com>, jingle.wu@emc.com.tw,
	josh.chen@emc.com.tw
Cc: gregkh@linuxfoundation.org, jefferymiller@google.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	phoenix@emc.com.tw
Subject: Re: [PATCH v2] Input: elantech - fix touchpad state on resume for
 Lenovo N24
Message-ID: <ZkU3CiVIABLQvvKe@google.com>
References: <ZjQeE643YAbK1hq5@google.com>
 <20240503155020.v2.1.Ifa0e25ebf968d8f307f58d678036944141ab17e6@changeid>
 <CAMCVhVNr=ax6tv=VXRpQoz=z=yR+LiHGUU6r7LpHM4oBoJSKSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMCVhVNr=ax6tv=VXRpQoz=z=yR+LiHGUU6r7LpHM4oBoJSKSw@mail.gmail.com>

On Wed, May 15, 2024 at 10:29:58AM -0500, Jonathan Denose wrote:
> On Fri, May 3, 2024 at 11:12 AM Jonathan Denose <jdenose@google.com> wrote:
> >
> > The Lenovo N24 on resume becomes stuck in a state where it
> > sends incorrect packets, causing elantech_packet_check_v4 to fail.
> > The only way for the device to resume sending the correct packets is for
> > it to be disabled and then re-enabled.
> >
> > This change adds a dmi check to trigger this behavior on resume.
> > Signed-off-by: Jonathan Denose <jdenose@google.com>
> > ---
> >
> > Changes in v2:
> > - change ps2_sendbyte() calls to ps2_command()
> >
> >  drivers/input/mouse/elantech.c | 33 +++++++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
> > index 4e38229404b4b..18f26315cae25 100644
> > --- a/drivers/input/mouse/elantech.c
> > +++ b/drivers/input/mouse/elantech.c
> > @@ -1476,6 +1476,23 @@ static void elantech_disconnect(struct psmouse *psmouse)
> >         psmouse->private = NULL;
> >  }
> >
> > +/*
> > + * Some hw_version 4 models fail to properly activate absolute mode on
> > + * resume without going through disable/enable cycle.
> > + */
> > +static const struct dmi_system_id elantech_needs_reenable[] = {
> > +#if defined(CONFIG_DMI) && defined(CONFIG_X86)
> > +       {
> > +               /* Lenovo N24 */
> > +               .matches = {
> > +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +                       DMI_MATCH(DMI_PRODUCT_NAME, "81AF"),
> > +               },
> > +       },
> > +#endif
> > +       { }
> > +};
> > +
> >  /*
> >   * Put the touchpad back into absolute mode when reconnecting
> >   */
> > @@ -1486,6 +1503,22 @@ static int elantech_reconnect(struct psmouse *psmouse)
> >         if (elantech_detect(psmouse, 0))
> >                 return -1;
> >
> > +       if (dmi_check_system(elantech_needs_reenable)) {
> > +               int err;
> > +
> > +               err = ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_DISABLE);
> > +
> > +               if (err)
> > +                       psmouse_warn(psmouse, "Failed to deactivate mouse on %s: %d\n",
> > +                                       psmouse->ps2dev.serio->phys, err);
> > +
> > +               err = ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_ENABLE);
> > +
> > +               if (err)
> > +                       psmouse_warn(psmouse, "Failed to reactivate mouse on %s: %d\n",
> > +                                       psmouse->ps2dev.serio->phys, err);
> > +       }
> > +
> >         if (elantech_set_absolute_mode(psmouse)) {
> >                 psmouse_err(psmouse,
> >                             "failed to put touchpad back into absolute mode.\n");
> > --
> > 2.45.0.rc1.225.g2a3ae87e7f-goog
> >
> 
> Hello,
> 
> Is there anything else needed from me?

Josh, Jingle, do you have any feedback on this patch?

Thanks.

-- 
Dmitry

