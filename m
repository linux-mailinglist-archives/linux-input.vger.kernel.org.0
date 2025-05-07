Return-Path: <linux-input+bounces-12219-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C170AAEE67
	for <lists+linux-input@lfdr.de>; Thu,  8 May 2025 00:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10CCC173BB8
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 22:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE24F24469B;
	Wed,  7 May 2025 22:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqGHAhyE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828C217332C;
	Wed,  7 May 2025 22:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746655387; cv=none; b=Uy8CKkFOhr3zWgRgyTkmGm4tXcWc26CmF9vyTVhP+bP59uuMTZPzqLmP3nnCOwvhVhv1cmc4LZh4asRpFtaC46dKWKJ2Vp9rNZiWFwGLygKYYi1I92yiSTo/aEfsfDfJ7vmvoYyxa+eEdtSuDya869UV21RDH2i9OZd32WwtZ4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746655387; c=relaxed/simple;
	bh=0/lAnaPadbVA17wcpVmOQmvsd5rhkl4QrREFr0OLj3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfkkZwrxzRbKn35XB8OhiQJEFtUKwpgskkjfZgRNFeFoARnPrvoLZbllRlGV9hL/KJzvHa0KKLcORB+nb4Y6j0RzleEvhxD9jWSAo/YZc0IvWbFx7DgpwUIMV9zBuIAtWFXjBZIHp5qbemWbAl0JsSxyUserrOgbG13+ArR2Tak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqGHAhyE; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so360120b3a.2;
        Wed, 07 May 2025 15:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746655386; x=1747260186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XLCuwj4JR7PS32nXitq3gDnSRdVNzf3jHcA5VT1cdtE=;
        b=BqGHAhyE9dpa7Ew3SacJJk9dRz3Cfa0O9XzPeBjbAn8rhfjXV5N7DY9qCJ3+43/pdM
         Rardlo2IXF7xZAVcwrRWSXcZN8TflK0doPfQAcg7XOyU8d8m+TIfMeYS2xX4DX8G0078
         wxBeKDRinchr859lvrP6MM1k7lSlgp5IFLsifHydstqfVVJKe1PocAcjMe8pWynjpndN
         jMntnbWt4IptvCXawalAh1Yp7DsWjIMni+b53ndNTfRNciqB6WLlXkLVjSb08A5E2Buw
         poksjVXdBxtmVzULq4wBdw0Sh4FyDpbiMVGCsF0sWyKeaFRnpvDrhzeA/JBB/Nryt3dd
         DPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746655386; x=1747260186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLCuwj4JR7PS32nXitq3gDnSRdVNzf3jHcA5VT1cdtE=;
        b=r0cqTpNiBBlAn9cxJa7yXL75Wzv2JRYD66k3vRGQyJ1ENkIVLiZjbZQwOTwBXOo82P
         51ub8tfHanAXld5r+XDnY+LhnsHALCocPzA3820jlohK0/HgPx70HlkV7qBK8husNEeL
         kv8pZv9XXOgC/RSMQsy2Cf1NDIebKnltguybVlvK/8d0TstuH6kvs5nl3WM2bMZihnl7
         OgZuLME8+2hid1NubAWaQHj4A8ZkSrgnVU0QsoVQJ4eYGewiJdbgvYHD6B+drTC11ysO
         uLFZAzKGYCCmyE1T+w5CS/vmvUJqavDsmiDzGOSBZzbk5p3/8drywjhTLIpRRddJ5iRP
         Uexw==
X-Forwarded-Encrypted: i=1; AJvYcCUUlfasbGeXerD3YYqfocDTrSUehd7dPeCyx84nbWKluxUnYUWD8dCsPVTuRERSq36GIzaeBjOx0td7/rDN@vger.kernel.org, AJvYcCWsJvhxeyCSPL+JvC3Q3Fm8bgJ1jM6YNKMoBZyBIDxWXsOJWJ0A15gp7D5Y7mUYdzW3quJrLHkKucI8xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXuvMQDu3Fe1nHZvC52fDFj+Ztxf6P14pJtPNgpJBsqsXgWr6B
	3sSkP98f+FnmZTuAjZ5rdKoA4xTqkABwsYHY9yEXZ+iVX/xQk6fi
X-Gm-Gg: ASbGncvCTTt4IQJcyjVGodsNl7OaTYXL86bS1NvGtdTA5DcorU2ktcXcKfh5vsptbxq
	AosiBCq++8USFOdKNWJeydYkJ+HjAdlKZlfRfMjqP+WB5CPSIJcdnwHV/U5O3HxKrZy1QhIHk6f
	EptF5U3RbP2NMLS5h1rrXGFIUqfhkyJd3GfoXNX+qMVcJohDht/5jycn6AqXMKgoEPnq1yShUtM
	mTIxu+NOnFRvsHf7BFjG0KO7pgQrVGxsfX5jntc9FKBXt+ftGfEqsXWULESHR/6gUqBWsRxKBX/
	7I77l/z2mGzjREtrsSl2CLIGOVE7qPlmI3zVHML+
X-Google-Smtp-Source: AGHT+IHtyH9/nYOAy4Nkprd/zD4X9rHxodVpUS/HoDe6dKNNgP51Gz4FqZMQjz/badMFfSIEAH09tQ==
X-Received: by 2002:a05:6a21:108c:b0:1f5:8cdb:2777 with SMTP id adf61e73a8af0-2159af284e6mr1292053637.3.1746655385543;
        Wed, 07 May 2025 15:03:05 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fe5b:f2b0:d1f:f5ac])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059020dd4sm11857522b3a.117.2025.05.07.15.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 15:03:05 -0700 (PDT)
Date: Wed, 7 May 2025 15:03:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Manuel Fombuena <fombuena@outlook.com>, Carlos Song <carlos.song@nxp.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Clark Wang <xiaoning.wang@nxp.com>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xuntao Chi <chotaotao1qaz2wsx@gmail.com>, 
	Matthias Eilert <kernel.hias@eilert.tech>, Markus Rathgeb <maggu2810@gmail.com>
Subject: Re: [PATCH 0/4] Input: synaptics - enable InterTouch for new devices
Message-ID: <7rxfnqq6qrqi6fzct7d7a3okmfixohpnsdveg2mxf2u3ahjh4i@5k3fq2pabk6m>
References: <PN3PR01MB95975989E919EDEA7717BF89B888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB95975989E919EDEA7717BF89B888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>

On Wed, May 07, 2025 at 02:05:14PM +0000, Aditya Garg wrote:
> Hi all
> 
> The linux input mainling list seems to have receivied reports of requiring
> psmouse.synaptics_intertouch=1 for some devices. This patch series adds support
> for InterTouch on the following devices by adding them to the list of
> SMBus-enabled variants:
> 1. TOS01f6 (Dynabook Portege X30L-G)
> 2. SYN1221 (TUXEDO InfinityBook Pro 14 v5)
> 3. DLL060d (Dell Precision M3800)
> 4. TOS0213 (Dynabook Portege X30-D)
> 
> Aditya Garg (3):
>   Input: synaptics - enable InterTouch for TOS01f6
>   Input: synaptics - enable InterTouch for SYN1221
>   Input: synaptics - enable InterTouch for DLL060d
> 
> Manuel Fombuena (1):
>   Input: synaptics - enable InterTouch for TOS0213
> 
>  drivers/input/mouse/synaptics.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> -- 

Applied the lot, thank you.

-- 
Dmitry

