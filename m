Return-Path: <linux-input+bounces-238-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5FE7F8862
	for <lists+linux-input@lfdr.de>; Sat, 25 Nov 2023 05:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89137281BCC
	for <lists+linux-input@lfdr.de>; Sat, 25 Nov 2023 04:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37ED814;
	Sat, 25 Nov 2023 04:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gv+OSwCy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8EEC1710;
	Fri, 24 Nov 2023 20:58:32 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3b2df2fb611so1664384b6e.0;
        Fri, 24 Nov 2023 20:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700888312; x=1701493112; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H7+G6kTUsYcf2EuznU9nGg+6a0PiyVvvTpJ6OmKLYnU=;
        b=gv+OSwCylABvUN1LZmQTP/j0ybV6RsGST6j1x6ms/zskLT0z0jxfvYCEgvZ35M5r03
         CpH+jo+oDTuraekfbR+QJRyWrk9wZZ1oh0PUgQqgX37p0fpUx+gXgTnVq5y0Sf7a6LS3
         92RnmPiQSNt5KioNIRoLhZz/OkirU9NXcpgXKV5meR7iVpp1K1BV3ltVfPAPhNBOxX6X
         bf6W1PScs/xTC13BCoBlPfXrymrmAiottmNI7CrbZmLDZ+95rJ1K2rkBzjebXCsW+WHp
         6W/v31gr94vHGRZyZ3nhIAN3GnvqIdwEZxYTcN6ObWe1PrHPC4yMIhwLQaDiPfxOyczk
         KHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700888312; x=1701493112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7+G6kTUsYcf2EuznU9nGg+6a0PiyVvvTpJ6OmKLYnU=;
        b=oSdDpPOIs0puZKUxX3WjgPJCQDxhB1hZbTzQDio8kKzJ/VLolt9fR0y4vunGsktsIJ
         JReTR4YKbi3nZI8uJsXHSyWlz0VNc1CWSyuQtnAlL5gWFsbKQF9P0+eSXS65F0HiA0cz
         NZvl83HxuIuELDqFG+VobdzQx9h2sSP0VrcCvvRaLpDDa3B8exNg0s9X5s1VYzIlHob6
         WiGsVpNdA0fdCuLiPuIN0A1H2S0vzRw0qTyxEWYZ5WCcONmJ9M8IzmHfyyeQPwlTTxlX
         gbyeLyXPAjOwDtTucRPFurf5cfLGloFbocNht2m14F4qxBkvR8ruVIJtjGKX1z5DH/3j
         mV9Q==
X-Gm-Message-State: AOJu0Yw1WCO/7ZY/mpTBz++5JT8XFjgT7/3/lY/2BYYdedYh4FN8uDB2
	sdnsblqpec+upfqQz0zOSoc=
X-Google-Smtp-Source: AGHT+IFeTSL/V+P+KPM4Qgxl19x/Ka79WuZ6Y2vXNvWEwWRybB7C/6fG5QLOW4EjPMH7qokAspkoSg==
X-Received: by 2002:a05:6808:13c2:b0:3b8:3e4d:605e with SMTP id d2-20020a05680813c200b003b83e4d605emr7298648oiw.42.1700888311914;
        Fri, 24 Nov 2023 20:58:31 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:8b5c:82d0:578f:d0])
        by smtp.gmail.com with ESMTPSA id fd39-20020a056a002ea700b006cb7b0c2503sm3703306pfb.95.2023.11.24.20.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 20:58:31 -0800 (PST)
Date: Fri, 24 Nov 2023 20:58:28 -0800
From: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
To: Alexey Makhalov <amakhalov@vmware.com>
Cc: Simon Horman <horms@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
	"H . Peter Anvin" <hpa@zytor.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"dave.hansen@linux.intel.co" <dave.hansen@linux.intel.co>,
	"bp@alien8.d" <bp@alien8.d>, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, Zack Rusin <zackr@vmware.com>,
	Tim Merrifield <timothym@vmware.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"richardcochran@gmail.com" <richardcochran@gmail.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
	Pv-drivers <Pv-drivers@vmware.com>, Nadav Amit <namit@vmware.com>,
	Ajay Kaher <akaher@vmware.com>, Jeff Sipek <jsipek@vmware.com>
Subject: Re: [PATCH 4/6] input/vmmouse: Use vmware_hypercall API
Message-ID: <ZWF-9DmwakJBonmf@google.com>
References: <20231122233058.185601-1-amakhalov@vmware.com>
 <20231122233058.185601-5-amakhalov@vmware.com>
 <20231124194646.GW50352@kernel.org>
 <A64E0517-57D9-47DF-8DD8-040EE6843246@vmware.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A64E0517-57D9-47DF-8DD8-040EE6843246@vmware.com>

On Sat, Nov 25, 2023 at 01:22:58AM +0000, Alexey Makhalov wrote:
> On Nov 24, 2023, at 11:46 AM, Simon Horman <horms@kernel.org> wrote:
> > 
> > On Wed, Nov 22, 2023 at 03:30:49PM -0800, Alexey Makhalov wrote:
> >> Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
> >> Eliminate arch specific code. No functional changes intended.
> >> 
> >> Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
> > 
> > Hi Alexey,
> > 
> > it is not strictly related to this patch, but I notice than an x86_64
> > allmodconfig build with W=1 using gcc-13 fails to compile this file.
> > 
> > It appears that the problem relates to both priv->phys and
> > psmouse->ps2dev.serio->phys being 32 bytes.
> > 
> > 
> > drivers/input/mouse/vmmouse.c: In function ‘vmmouse_init’:
> > drivers/input/mouse/vmmouse.c:455:53: error: ‘/input1’ directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Werror=format-truncation=]
> >  455 |         snprintf(priv->phys, sizeof(priv->phys), "%s/input1",
> >      |                                                     ^~~~~~~
> > drivers/input/mouse/vmmouse.c:455:9: note: ‘snprintf’ output between 8 and 39 bytes into a destination of size 32
> >  455 |         snprintf(priv->phys, sizeof(priv->phys), "%s/input1",
> >      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >  456 |                  psmouse->ps2dev.serio->phys);
> >      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > ...
> 
> Hi Simon, thanks for reporting the issue.
> Zack, please take a look.

We want the truncation behavior and we do not want GCC to make noise
about these, that is why "format-truncation" is explicitly disabled for
normal compiles. I guess we should exclude it even when we compile with
W=1 instead of doing pointless changes in the drivers.

Thanks.

-- 
Dmitry

