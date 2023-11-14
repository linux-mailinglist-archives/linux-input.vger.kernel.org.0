Return-Path: <linux-input+bounces-51-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9B67EAD56
	for <lists+linux-input@lfdr.de>; Tue, 14 Nov 2023 10:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E54A1F22C27
	for <lists+linux-input@lfdr.de>; Tue, 14 Nov 2023 09:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B043168D3;
	Tue, 14 Nov 2023 09:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GwMtwQgf"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D131ABE4D
	for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 09:50:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55CAA196
	for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 01:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699955417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+sLJfqjaYWUtHWxCAiz4/S0W/vNbdbImGbP2pch1Jh8=;
	b=GwMtwQgfazPC2+zcl7ri2o3KfHy20b7wd+pr5VZuKJSqePoNkPtfhc4h2kQRSuV70h+5lg
	OuRXMnfGsRus2FIE/YftCyS2LOJ0IvJ5/1Ymxqi0XcAchOPmYfw/RORf2Z5ZiJrNuaF1d2
	8BSvZLkUfprb+hfTIeR4P7PaCo/c/Ow=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-l3w_2VzJPXO4mBknAOJ8xA-1; Tue, 14 Nov 2023 04:50:16 -0500
X-MC-Unique: l3w_2VzJPXO4mBknAOJ8xA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9c37ff224b9so31108566b.0
        for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 01:50:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699955415; x=1700560215;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+sLJfqjaYWUtHWxCAiz4/S0W/vNbdbImGbP2pch1Jh8=;
        b=qhynZy/hzXpHauoc/1vKWPWUbNM68cOo86knnFVVWm4/OvuBByaE23//yeizP49Wyv
         LZaN4iyVPrUXaS/R8/GmOG/mzpnWb5gqTL0Jn9LmB4Pmivv2npo/0yYgxioxAm72d5bw
         1Fx++ZaGJ1kSpMXI+tjHa9ejYjE7JC+yF711lBuTVfqQ/DNkjNia1HCrWcX0Z60KEbWm
         N8Lhkj54H73kONMPxMwR7bi4VJRYt3E/U7g0lqcaGmDxsNgqd4AYBFugHYiyTDNhCpAj
         VzwGZYiLhkjExx48jZ+wcKSFtFkFc2TWlbQRWs/dpQLk2ZEJ3WtQxxWQTt15DRKGCJwS
         IQcw==
X-Gm-Message-State: AOJu0YyAcroVqk06Ghs+gceB/f1QHS3Li4G2R+CKvC6ezP3CmIG87WJo
	h+q90h9hWBZNDQQVS+Ek6niNMtU9Dhuni3rJZGVmI9r2eV5EZ+1AXxudGYeC8AIl3KpKTCoQdoM
	+SVNzAfKBrJ6YYwe0cYxNhJo=
X-Received: by 2002:a17:906:73d0:b0:9a6:5340:c337 with SMTP id n16-20020a17090673d000b009a65340c337mr1134458ejl.2.1699955415056;
        Tue, 14 Nov 2023 01:50:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJUR+jNGsAw/tTtbWekrxfexpAryQtdC0VkV9YEEUzuBgSaU2mkppOIWodkNt6AMxeDjkniw==
X-Received: by 2002:a17:906:73d0:b0:9a6:5340:c337 with SMTP id n16-20020a17090673d000b009a65340c337mr1134439ejl.2.1699955414700;
        Tue, 14 Nov 2023 01:50:14 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-230-91.dyn.eolo.it. [146.241.230.91])
        by smtp.gmail.com with ESMTPSA id me19-20020a170906aed300b009ae587ce133sm5256612ejb.188.2023.11.14.01.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 01:50:14 -0800 (PST)
Message-ID: <1b86390b8d61a4b1c56be47f9b0721734851426f.camel@redhat.com>
Subject: Re: [PATCH v1 1/1] treewide, spi: Get rid of SPI_MASTER_HALF_DUPLEX
From: Paolo Abeni <pabeni@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Yang Yingliang <yangyingliang@huawei.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown
 <broonie@kernel.org>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org,  linux-usb@vger.kernel.org,
 linux-spi@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>
Date: Tue, 14 Nov 2023 10:50:12 +0100
In-Reply-To: <20231113111249.3982461-1-andriy.shevchenko@linux.intel.com>
References: <20231113111249.3982461-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2023-11-13 at 13:12 +0200, Andy Shevchenko wrote:
> The SPI_MASTER_HALF_DUPLEX is the legacy name of a definition
> for a half duplex flag. Since all others had been replaced with
> the respective SPI_CONTROLLER prefix get rid of the last one
> as well. There is no functional change intended.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

For the net bits:

Acked-by: Paolo Abeni <pabeni@redhat.com>


