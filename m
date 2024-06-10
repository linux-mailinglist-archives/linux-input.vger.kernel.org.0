Return-Path: <linux-input+bounces-4301-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D1990289E
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 20:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B34C284B05
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 18:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71E9143C43;
	Mon, 10 Jun 2024 18:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="B/67php/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aZVo2f/h"
X-Original-To: linux-input@vger.kernel.org
Received: from wfhigh3-smtp.messagingengine.com (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D4215A8;
	Mon, 10 Jun 2024 18:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718043941; cv=none; b=X7p0eFqd/nmdPw74G1+RwQkpLtmLwDxFS/0I1WchQNEniRwchuaVycWA2SFI3UfYbr1Xsr8GfST3Ej+3s0cpRg/7yLF3YmG/gqm85mb9jU+Iig0gtc0bzjGLTKmYYGRz1yMFQUVp1txHyvyCU1GhvogX4PQtO3QEuZKpRe1IFbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718043941; c=relaxed/simple;
	bh=aP9cBapF3uNo1FI3ZpJLWwcc9xHK/PpDMbxjJDR6N/Y=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=tHPfac90X8fTPp/6a0BjU7kGpif2M1hKDyGInksFbMr+5UWAMpDbc9R83AodxBbCPPszNPTV7lUI2Xa3hTMQ9DpVe+/WIiSpp9rzjy/uBkUf50uxuNlsXHNidvh+TOnMqExy5Jm3bFCC6PCU/9hmoxywewt3WK1/q15TI8FYeys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=B/67php/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aZVo2f/h; arc=none smtp.client-ip=64.147.123.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 43FCB18000BA;
	Mon, 10 Jun 2024 14:25:38 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 10 Jun 2024 14:25:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718043937;
	 x=1718130337; bh=vY0HlAqLR+9vVLht9gOAcC05xIRzjm1Orljq/RiGYz8=; b=
	B/67php/Rvpfq7xJAzp7JETj7d7LxHNcEYBxCdZr2S0xEY/COiXxiARQQna1g5Zx
	UEAlfrtPB7ai5Qd7HPLxRFqWz6Hcp/9htXjSKG1G4Qwlpni6k/gIVrFTqyT5RCjn
	mHFLW3N4ZXOCaAsOME1le4k8Rq6jD+j19ABgnW3FGiE2CjNVc3AIV6Ws60lvEyiv
	Pwbwbngbgj7EKe7pxaUUJj3YO9AYyCd+89jdBZ3FcFZiaMS/mQu6J6Uynb9hz3bg
	ToLd+vIcr/VLg4hTMIrU8ca+wlSP0OmYZ9VGDGclKQfPal0Li8colOpeRjsaURVl
	13fP/OF7iGWgFHBhy+9ZKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718043937; x=
	1718130337; bh=vY0HlAqLR+9vVLht9gOAcC05xIRzjm1Orljq/RiGYz8=; b=a
	ZVo2f/hcnhew9AfvgyeNJcm0bu7wzwdwDPcA8GSCbPWmQOq62Z4qBKvxBy6p1jct
	1+o+1E2SKuH/nW3wGR2d9Ce5y8hdCd4OYpzkUrepbt9YgLp4ftO8fn3CdR8kQuIU
	T8XSp9rO4hJc6R6XR0eJQItTiNUsuFpsiMdi8WhD4ltHM6r448u6oa4s5X5klJ/7
	jiQ/afvr8TtBIVJOyShLcyaOvMPZ2uUQCoyMsBtasxmvZpA8HLJB5xMUWxlqyDt5
	jizyWUDJTBpv8LxRYGOyoX5xNIO51/RTJsd0XynhNNFI1v3DQX1qbJnsPfQfK5ZL
	uWPhw2qBfbJ5LLD9qR00g==
X-ME-Sender: <xms:IUVnZrBesjXipWnxLWj5wW3zikfcZATjdmm0svKXcy_of4QjyCNQsQ>
    <xme:IUVnZhiNOlDfhKF9V4FwcGOFNkA5YIwlbpk6XjPp3Zo6zQkjYxgfv-4WRnVFhjXCf
    kgSJoC_gw_3GE5pkPc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedutddguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
    tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:IUVnZmn7MZ2HrzSB5xGTghJISPueeZ412EmaqKXd5QN8uec2vLzMYA>
    <xmx:IUVnZtzN1-0lDvxZ49LhH8D27qc58vM42H6xQ8VLiv71xTi6IuyM3w>
    <xmx:IUVnZgQT6vLcMojKG1XEDBN8YdXZiPstr9jJ4EzcHbmTBBcfBY-s9w>
    <xmx:IUVnZgZNVjvf4kXrjZih0WXLKdA-aVhK_Eyg0ZLXztfv-9LIc0-CAQ>
    <xmx:IUVnZp8dLPh4U0s72TBIcnOvLHd9_Grg4WGJfI-kLmaugoKMkeY5D3Ff>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5554BB6008D; Mon, 10 Jun 2024 14:25:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <8d93cdd6-379b-48e7-8a10-9df190b12623@app.fastmail.com>
In-Reply-To: <Zmcwlt6Kfpt09tKi@fedora>
References: <20240529094816.1859073-1-arnd@kernel.org>
 <ZmSi5_-4mD4AaIJW@fedora>
 <54c19328-35e2-4506-aa3a-a0b08813d873@app.fastmail.com>
 <Zmcwlt6Kfpt09tKi@fedora>
Date: Mon, 10 Jun 2024 20:25:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Jiri Kosina" <jikos@kernel.org>,
 "Benjamin Tissoires" <bentiss@kernel.org>,
 "Rahul Rameshbabu" <rrameshbabu@nvidia.com>,
 "Fabio Baltieri" <fabiobaltieri@chromium.org>,
 "Ivan Gorinov" <linux-kernel@altimeter.info>,
 "Johannes Roith" <johannes@gnu-linux.rocks>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: uclogic: avoid linking common code into multiple modules
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024, at 18:57, Jos=C3=A9 Exp=C3=B3sito wrote:
> On Mon, Jun 10, 2024 at 08:24:51AM +0200, Arnd Bergmann wrote:
>> On Sat, Jun 8, 2024, at 20:28, Jos=C3=A9 Exp=C3=B3sito wrote:
>
> Turns out that, since the last time I checked the KUnit docs,
> we have "EXPORT_SYMBOL_IF_KUNIT" available now.
>
> I think we can use it and your final patch, without the MODULE_*
> changes, could look like:

Looks good to me, can you send that with

Reported-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Arnd Bergmann <arnd@arndb.de>

?

Feel free to take my original changelog text if that helps

     Arnd

> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index ce71b53ea6c5..e40f1ddebbb7 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -154,10 +154,8 @@ obj-$(CONFIG_HID_WINWING)  +=3D hid-winwing.o
>  obj-$(CONFIG_HID_SENSOR_HUB)   +=3D hid-sensor-hub.o
>  obj-$(CONFIG_HID_SENSOR_CUSTOM_SENSOR) +=3D hid-sensor-custom.o
>=20
> -hid-uclogic-test-objs          :=3D hid-uclogic-rdesc.o \
> -                                  hid-uclogic-params.o \
> -                                  hid-uclogic-rdesc-test.o
> -obj-$(CONFIG_HID_KUNIT_TEST)   +=3D hid-uclogic-test.o
> +hid-uclogic-test-objs          :=3D hid-uclogic-rdesc-test.o
> +obj-$(CONFIG_HID_KUNIT_TEST)   +=3D hid-uclogic.o hid-uclogic-test.o
>=20
>  obj-$(CONFIG_USB_HID)          +=3D usbhid/
>  obj-$(CONFIG_USB_MOUSE)                +=3D usbhid/
> diff --git a/drivers/hid/hid-uclogic-rdesc.c b/drivers/hid/hid-uclogic=
-rdesc.c
> index b6dfdf6356a6..6c7a90417569 100644
> --- a/drivers/hid/hid-uclogic-rdesc.c
> +++ b/drivers/hid/hid-uclogic-rdesc.c
> @@ -17,6 +17,7 @@
>  #include "hid-uclogic-rdesc.h"
>  #include <linux/slab.h>
>  #include <asm/unaligned.h>
> +#include <kunit/visibility.h>
>=20
>  /* Fixed WP4030U report descriptor */
>  __u8 uclogic_rdesc_wp4030u_fixed_arr[] =3D {
> @@ -1242,3 +1243,4 @@ __u8 *uclogic_rdesc_template_apply(const __u8=20
> *template_ptr,
>=20
>         return rdesc_ptr;
>  }
> +EXPORT_SYMBOL_IF_KUNIT(uclogic_rdesc_template_apply);
>
> I hope that helps,
> Jose

