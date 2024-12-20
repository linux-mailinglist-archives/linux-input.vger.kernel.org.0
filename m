Return-Path: <linux-input+bounces-8703-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B119F9882
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2024 18:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03054164FEA
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2024 17:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC02521CA02;
	Fri, 20 Dec 2024 17:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6kbVWmH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C2021C9FB;
	Fri, 20 Dec 2024 17:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715360; cv=none; b=Sx4FXOY1DD3O93QeXqDWMxIf0l3kX665HXJgrSpWF/cAk8NJE+FW6vOeqJJZEBnYK5E8STW6JU+e9lkx5j1rdWA27yzqmWyiZDL1oVQViEcDO3Sf4XfgpmEzqfzJd+ddDW8/qvpfsXU617d9PLvfUQb81JEi4woHmp8hIPMtPtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715360; c=relaxed/simple;
	bh=ZhPYyLB/dT9dPhpnEcDy3EI45MLji+hFPevAnauFv+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMudEgdXmZfkoKkq8e1upLJ/5C0RkdpbbVlZXIEFOspRf4ievnpkLIAmuaiAeZ42tG/aeCj3OVk9OlpFYPedXhOLCzi9RgVYSnAdIVBraJToT67jRPRgRdA19abKa+qhwtmuJ/Cud8ZqJLxouIIG0rJnJsWHixO2hSDDhY7Qp24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6kbVWmH; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-215770613dbso15508365ad.2;
        Fri, 20 Dec 2024 09:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734715358; x=1735320158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6xnQcoO9tpkm90RAWvpq8Fq5hUykBq4LGaMhTTFZrKM=;
        b=Z6kbVWmH3T53FRk57cVaJvpu9hLGLi5bcfm99DDcbhDC5/B77FAnVyTFMV0+4Fp03Q
         J++iyJxQ+3KCT+Ta23s5mc/u/jfA/RrAtmiI/fmfQ4wE4TtMDIbOK1WmkWkWANJQNPYh
         hsRXQ12zwQbW+zZqCWXRayygCNYbAuPa/bt/QUjcY/en62GsueSBCYJXNzUqrGCCwhyy
         cQ+X6k2F1Y9RioLOk+ubRl56ZiPT63e8XrwKFN/tyGMEm24IwE6EmonK/NEXexLol6Au
         7Lv5uizEjW9tJ0+xsc8gRanzCY0+8IV4t0+3xTzvWEYoSjtSnP9hvpmTfVGqris5sNVn
         Qoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715358; x=1735320158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xnQcoO9tpkm90RAWvpq8Fq5hUykBq4LGaMhTTFZrKM=;
        b=eDm4Pk5Vbit1JFCjkIFIdwge7T2ubmjdbCDzfiNJpFSF0p1yh1rfWKlhQ6H1pdm2X9
         EaOJ8zanxOySRzfYlUlhGCgBVm1Ao1srGFonotDRbEa5UmbuVFAneYW36bN4hKkukhMx
         8Z1cV5imqT3JqI8D0zVtZa0sfPWcu/g2Lsahbwqe8+pbSuTW7WiGbRiyUhM2KOz7PLrU
         kPR4IynBiMoz3UKpQDSirbJhQJh53IJuSlIlMzRyfwR18mSuppzhv9bEaz5cwKBbeSa8
         sktHVRfdEeLLY0cC0Crz0xxO+K3oBK2ywQNG5768zYbPkdl/pi79/tEKFxdq4RHB/kI0
         kixw==
X-Forwarded-Encrypted: i=1; AJvYcCUFMEcMEOzwQu0migUpaARemNbEvhOEQ8doCKWb+5dlL8B560q8LkZd2K6APt7JkICcIXKGnLg4pRQ9Ooy5@vger.kernel.org, AJvYcCWYmqQLZw37TqSGGD3yYFRygSIjwo/HIAvZHpAH+9ZRkDYyWH0sJrKBRADplF7fqlqJtxwrhxYyYJKVcw==@vger.kernel.org, AJvYcCXixj5KnGXb2iN1AHOdWdRKCJJMdVr9Am6bsKKNourxpuBKb24rClka2PUs2swQKHqmjtRxPk2EoFjtGdhTDBEKpfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRy7/Pr3iSExRDBmZ5HTb9PUGa1I5wu104DbRkue2J+AM9Rj8d
	jy/ggyvRMOI7wKMbefUJlRtGZMc8hJSIafq5Wb0tIiDdSylfWr+U
X-Gm-Gg: ASbGncvBT3Vm0M8tWHDukvcHzYG9hgXOr6YqBQjqzLy+nXOcQ048avxN0fWkJBM1SNU
	bMicNikt+qDWqymmzcZLf74sNiD/BxXzsAMatSWK8AcaEjDIxuen95Hk183hH9v+ok6bAwlQKFg
	WcWRLcSJvq+hUSg5cWNjsgM3ITiRcbiXfYJawTdY579YnP1xs+w7Dy5sB4AxZ6M/FTdZEFKeqr3
	Zy6pLeML6UY2sKwVqmhbGoXjXq26Qe3i0y/mJ/bw2pVWoFfFzA331P2lw==
X-Google-Smtp-Source: AGHT+IEU77Dt9O0g64ZX70EZN+TDiG3shcsHfINB+fc7qqN0xMWfRKXgTdt4B8o2c35Snl9+qouaPw==
X-Received: by 2002:a17:903:228d:b0:215:a2f2:cfbf with SMTP id d9443c01a7336-219e6e9ded8mr47056435ad.18.1734715358354;
        Fri, 20 Dec 2024 09:22:38 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:4f42:14ea:396d:8b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02544sm31582885ad.255.2024.12.20.09.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:22:37 -0800 (PST)
Date: Fri, 20 Dec 2024 09:22:35 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH 2/8] Input: ff-core - make use of __free() cleanup
 facility
Message-ID: <Z2Wn2wTesz3nj-vO@google.com>
References: <20241107071538.195340-1-dmitry.torokhov@gmail.com>
 <20241107071538.195340-3-dmitry.torokhov@gmail.com>
 <CGME20241220123701eucas1p23125e0738985ffe35cbe9624dff08972@eucas1p2.samsung.com>
 <7d1e1c89-d4a6-4b3d-a674-5ef497c2c496@samsung.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d1e1c89-d4a6-4b3d-a674-5ef497c2c496@samsung.com>

On Fri, Dec 20, 2024 at 01:36:59PM +0100, Marek Szyprowski wrote:
> On 07.11.2024 08:15, Dmitry Torokhov wrote:
> > Annotate allocated memory with __free(kfree) to simplify the code and
> > make sure memory is released appropriately.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >   drivers/input/ff-core.c | 19 ++++++-------------
> >   1 file changed, 6 insertions(+), 13 deletions(-)
> 
> This patch landed in linux-next as commit 5203b3a18c1b ("Input: ff-core 
> - make use of __free() cleanup facility"). In my tests I found that it 
> causes the following kernel panic on some of my test boards. Reverting 
> it, together with fd5ba0501d38 ("Input: ff-memless - make use of 
> __free() cleanup facility") on top of next-20241220 fixes this panic 
> issue.

Gah, I fixed this once and then undid it for some reason. I think the
following should fix the problem:


diff --git a/drivers/input/ff-core.c b/drivers/input/ff-core.c
index a235d2eb6b31..c25e05eeb8e5 100644
--- a/drivers/input/ff-core.c
+++ b/drivers/input/ff-core.c
@@ -315,7 +315,6 @@ int input_ff_create(struct input_dev *dev, unsigned int max_effects)
 	ff->max_effects = max_effects;
 	mutex_init(&ff->mutex);
 
-	dev->ff = no_free_ptr(ff);
 	dev->flush = input_ff_flush;
 	dev->event = input_ff_event;
 	__set_bit(EV_FF, dev->evbit);
@@ -328,6 +327,7 @@ int input_ff_create(struct input_dev *dev, unsigned int max_effects)
 	if (test_bit(FF_PERIODIC, ff->ffbit))
 		__set_bit(FF_RUMBLE, dev->ffbit);
 
+	dev->ff = no_free_ptr(ff);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(input_ff_create);
diff --git a/drivers/input/ff-memless.c b/drivers/input/ff-memless.c
index 0bbeceb35545..e9120ba6bae0 100644
--- a/drivers/input/ff-memless.c
+++ b/drivers/input/ff-memless.c
@@ -524,7 +524,6 @@ int input_ff_create_memless(struct input_dev *dev, void *data,
 		return error;
 
 	ff = dev->ff;
-	ff->private = no_free_ptr(ml);
 	ff->upload = ml_ff_upload;
 	ff->playback = ml_ff_playback;
 	ff->set_gain = ml_ff_set_gain;
@@ -541,6 +540,8 @@ int input_ff_create_memless(struct input_dev *dev, void *data,
 	for (i = 0; i < FF_MEMLESS_EFFECTS; i++)
 		ml->states[i].effect = &ff->effects[i];
 
+	ff->private = no_free_ptr(ml);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(input_ff_create_memless);


Thanks.

-- 
Dmitry

