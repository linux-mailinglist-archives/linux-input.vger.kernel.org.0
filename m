Return-Path: <linux-input+bounces-9200-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 786C8A0B86F
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 14:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07DE87A050C
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 13:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE4F23DEB1;
	Mon, 13 Jan 2025 13:42:41 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1F823A587;
	Mon, 13 Jan 2025 13:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736775761; cv=none; b=g4Jk0WCYgymECpyl454/cRrD9YvaSSfoOunxeV9+xaUz+NMIquhGqWdRthyE0OnAMB3NpVpYy7xlk4/gIO4M88hwTp78kngKcua6DZxIxJ/YMZkWUNSc9zCtRxV58JEOtveCGz3KdW2g9CMn82JXNU+mBB7HDynkJTRrm9dD1c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736775761; c=relaxed/simple;
	bh=ZaVq1wNc0eCpPcfUj7XBO5AjZblImkM1t2kdVBZFymU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=txRKiLdRRTFPpHfL8NamThgLq1aVAiP7DpCS2S3Dq5XqVco3J+Z2kgs/PBBezeEpCx1d6K/+mTwLegkYdsKius0cg/VWuACo+uRJF3LRNlRClHlcSYOZam8a2csEJJdfx2Q88RVK/Mt0DXAyIYKZk2gShP1BBvYSYyFyi2v4/M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id E21032000B;
	Mon, 13 Jan 2025 13:42:36 +0000 (UTC)
Message-ID: <009d72b2713aa3409bd607251339996a9371abc7.camel@hadess.net>
Subject: Re: [PATCH v2 5/5] HID: steelseries: remove unnecessary return
From: Bastien Nocera <hadess@hadess.net>
To: Christian Mayer <git@mayer-bgk.de>, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>
Date: Mon, 13 Jan 2025 14:42:36 +0100
In-Reply-To: <20250112114438.2196-6-git@mayer-bgk.de>
References: <20250112114438.2196-1-git@mayer-bgk.de>
		 <20250112114438.2196-6-git@mayer-bgk.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-GND-Sasl: hadess@hadess.net

On Sun, 2025-01-12 at 11:44 +0000, Christian Mayer wrote:
> Remove unnecessary return in a void function.
>=20
> Signed-off-by: Christian Mayer <git@mayer-bgk.de>

Reviewed-by: Bastien Nocera <hadess@hadess.net>
Tested-by: Bastien Nocera <hadess@hadess.net>

> ---
> =C2=A0drivers/hid/hid-steelseries.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-
> steelseries.c
> index 1a935802880a..d4bd7848b8c6 100644
> --- a/drivers/hid/hid-steelseries.c
> +++ b/drivers/hid/hid-steelseries.c
> @@ -370,7 +370,6 @@ static void steelseries_srws1_remove(struct
> hid_device *hdev)
> =C2=A0
> =C2=A0 hid_hw_stop(hdev);
> =C2=A0 kfree(drv_data);
> - return;
> =C2=A0}
> =C2=A0#endif
> =C2=A0


