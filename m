Return-Path: <linux-input+bounces-1354-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7536E833354
	for <lists+linux-input@lfdr.de>; Sat, 20 Jan 2024 10:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 226C22837EC
	for <lists+linux-input@lfdr.de>; Sat, 20 Jan 2024 09:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A787D2E4;
	Sat, 20 Jan 2024 09:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJKRagFu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E321D2E2
	for <linux-input@vger.kernel.org>; Sat, 20 Jan 2024 09:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705741824; cv=none; b=uEZa/iXqqUkjvq/KwpJSTpNtITvl/rWRoSxIhAZdGupB0BVsOPQaYFI9xzYK0/avsr+P1Ly1G2K4l7N2OoppuUbwPpHECoQN6W+3tgJiG+jQ232QxyHxlAyXn5iFJpKdLn5eYq2tNRG9b8Y9UmqPCbvwg1s8dYvdXr+XowvMPDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705741824; c=relaxed/simple;
	bh=VqZ53j3J03wA8j1HuXdkD114Uq/QNobdMhYSMHlXzzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORn+Z1ZrsHv6rruSITA77yl8FPg7e4LQa7T58LmUEQLsEwyEQ0lSlSsvJdpT6bbwWxvAxCRLqh4mvP9qDR3JHx4piE5Y8LlzgRFQv9eQ9smMvRKEWxVogE5vekKB58gAE9ag2dmwCaUleOudqwAUzF1cb9M6VDEW/qHKMcOgVDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJKRagFu; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5cdfbd4e8caso1472497a12.0
        for <linux-input@vger.kernel.org>; Sat, 20 Jan 2024 01:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705741822; x=1706346622; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UkRhzpbPVOe8QS4SUPx4EE5a5zJLr1Fsu4gSLQ0VKbg=;
        b=HJKRagFuiqqA4dR8jpUmJQixN9TGtCve9DAH3eTK7moPKZF+Rj8A4GfXhP7JUyDR/B
         0yCnqLzeGwaiJ/OYAKjVkTJkPeFp/s0sOjMVyRcM8gKdXvfc7m3AcAKitCH+kZbTMrTx
         atv13+VaHkG9HEtLId/1M8NEQkQQabJobN5Yr0pxwcVLNtRBjh4NAtu1KPzdxLqWm+TV
         oBeu1X9tJ7l/5kXhE2olPUxV/4KIChEV570WCv+ALvzz9adCFWBhyYLpLw9j9WsqyaNs
         v9t7mlzlysLqN6p0FzH1QrQOt5Pw7DJW191HMGq/3CIUKEu3IxsFrjwUQspfrCW+nDs2
         BK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705741822; x=1706346622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkRhzpbPVOe8QS4SUPx4EE5a5zJLr1Fsu4gSLQ0VKbg=;
        b=dNv1mRxrwiCBww5+GvNQKsgiVKIWuLus5F8+BNRDdH4/koxOpIW7tOQas4/LZwynrN
         /dlYB3pOsdw91oddNzuj7m2rJ5+1QVgnN4FAvCthjgqpWVF5MESYLGi2gMjsVTGQF25Z
         VlBJBQudQv6T2kYZrWWRnPQiws/E0OPspE7rdJ3O1CSqtiMSAA4PWLaQ0SEgkpd5TSqc
         mM6j8P8GCYFc0yr84VLlA2nH4tIuuNv5hyXhnFqd/XjswUIgV6M9SfbGI3DAPoiZsYtt
         wyzdB25QHfitmqzutJuM4D+fRyG/V/YnQG9rcX3pi6QFp5a5AyrYjKfks3Ad7MKilqsY
         5jWA==
X-Gm-Message-State: AOJu0Yz++B3ZJ5YlyRGXGOpORNoXqVqw2Szh+sgAKR9TyXqCo9LyOQYw
	cmU3CiBo+RrszHxNPrm8X+vwYv0f7ie7BQf2VVnlhVgRGm3MnzWDFFCnun4n
X-Google-Smtp-Source: AGHT+IFts53+7S2nhFFukfolIM97akNGWmlLUlUWJpAWm2uLRaZOVfNvP5awhvr4FQ6sjjLJOnHESg==
X-Received: by 2002:a05:6a20:6f90:b0:19a:834f:3b05 with SMTP id gv16-20020a056a206f9000b0019a834f3b05mr1081347pzb.47.1705741822312;
        Sat, 20 Jan 2024 01:10:22 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:97b4:2663:16e0:cf81])
        by smtp.gmail.com with ESMTPSA id pl15-20020a17090b268f00b0028da4665bfbsm5491727pjb.8.2024.01.20.01.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 01:10:21 -0800 (PST)
Date: Sat, 20 Jan 2024 01:10:18 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-input@vger.kernel.org, contact@artur-rojek.eu,
	hdegoede@redhat.com, paul@crapouillou.net, peter.hutterer@who-t.net,
	svv@google.com, biswarupp@google.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v3] Input: adc-joystick: Handle inverted axes
Message-ID: <ZauN-gBsIPO0AyGE@google.com>
References: <20240115192752.266367-1-macroalpha82@gmail.com>
 <ZaozAsSblybdoeEK@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZaozAsSblybdoeEK@google.com>

On Fri, Jan 19, 2024 at 12:29:54AM -0800, Dmitry Torokhov wrote:
> Hi Chris,
> 
> On Mon, Jan 15, 2024 at 01:27:52PM -0600, Chris Morgan wrote:
> >  
> > +static int adc_joystick_invert(struct input_dev *dev,
> > +			       unsigned int axis, int val)
> > +{
> > +	int min = dev->absinfo[axis].minimum;
> > +	int max = dev->absinfo[axis].maximum;
> 
> I changed this to input_abs_get_[min|max](dev, axis) to avoid peeking
> into absinfo and applied.

Apparently min_array() and max_array() are a bit too new. Also I am not
sure if they are actually needed. Can we do it like this:

diff --git a/drivers/input/joystick/adc-joystick.c b/drivers/input/joystick/adc-joystick.c
index 10ee13465cfe..916e78e4dc9f 100644
--- a/drivers/input/joystick/adc-joystick.c
+++ b/drivers/input/joystick/adc-joystick.c
@@ -185,14 +185,14 @@ static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
 		if (axes[i].range[0] > axes[i].range[1]) {
 			dev_dbg(dev, "abs-axis %d inverted\n", i);
 			axes[i].inverted = true;
+			swap(axes[i].range[0], axes[i].range[1]);
 		}
 
 		fwnode_property_read_u32(child, "abs-fuzz", &axes[i].fuzz);
 		fwnode_property_read_u32(child, "abs-flat", &axes[i].flat);
 
 		input_set_abs_params(joy->input, axes[i].code,
-				     min_array(axes[i].range, 2),
-				     max_array(axes[i].range, 2),
+				     axes[i].range[0], axes[i].range[1],
 				     axes[i].fuzz, axes[i].flat);
 		input_set_capability(joy->input, EV_ABS, axes[i].code);
 	}

Thanks.

-- 
Dmitry

