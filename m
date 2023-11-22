Return-Path: <linux-input+bounces-201-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD607F43DF
	for <lists+linux-input@lfdr.de>; Wed, 22 Nov 2023 11:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C01DB20F42
	for <lists+linux-input@lfdr.de>; Wed, 22 Nov 2023 10:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E6C54BEB;
	Wed, 22 Nov 2023 10:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfB53MHk"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D49B250E7
	for <linux-input@vger.kernel.org>; Wed, 22 Nov 2023 10:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FA9C433C9;
	Wed, 22 Nov 2023 10:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700648941;
	bh=UkXYAIluwZuKwpdh6fsO1FTVAa5IFlUWb2j4eQFdSj8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CfB53MHk087rBJK+6Om9vqEZ4WUB6eN3cxPsvaKLA15M2NF6F2/vgYood90KN7vBT
	 +VT8hEI0eXTivJSK76cJ2G5deP3IJg/RDnivRmCaeM+xL4Uscyt1uJBkTt3gXJFOIc
	 RdjN2cqFhjQc/9M5eIN30SJ7U+ioN18icUQmyP21oDyKCGhatdicQZEhxQwZvYai2M
	 BDK3IJsRlBeMepKUPpLL4hE+VlYIGzme9bBO11wq9g0/F0cB75ImnWIxmzsAb4n88/
	 Q3wBNP5FsoOKN2oqjh9pTnHN2SpE2T6YfDS/EbDMOeqRosUdZKqB9b5GDNvkldSX8P
	 qp5uhY6NLOVfg==
Date: Wed, 22 Nov 2023 11:28:58 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Aoba K <nexp_0x17@outlook.com>
cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@jikos.cz>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH RESEND] HID: multitouch: Add quirk for HONOR GLO-GXXX
 touchpad
In-Reply-To: <DM6PR04MB412153443FCC205E5A9DF20DCEBBA@DM6PR04MB4121.namprd04.prod.outlook.com>
Message-ID: <nycvar.YFH.7.76.2311221128480.29220@cbobk.fhfr.pm>
References: <DM6PR04MB412153443FCC205E5A9DF20DCEBBA@DM6PR04MB4121.namprd04.prod.outlook.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 21 Nov 2023, Aoba K wrote:

> Honor MagicBook 13 2023 has a touchpad which do not switch to the
> multitouch mode until the input mode feature is written by the host.
> The touchpad do report the input mode at touchpad(3), while itself
> working under mouse mode. As a workaround, it is possible to call
> MT_QUIRE_FORCE_GET_FEATURE to force set feature in mt_set_input_mode
> for such device.
> The touchpad reports as BLTP7853, which cannot retrive any useful
> manufacture information on the internel by this string at present.
> As the serial number of the laptop is GLO-G52, while DMI info reports
> the laptop serial number as GLO-GXXX, this workaround should applied
> to all models which has the GLO-GXXX.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


