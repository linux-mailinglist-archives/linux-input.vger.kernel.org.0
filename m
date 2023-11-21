Return-Path: <linux-input+bounces-155-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB777F27A7
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 09:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D26D1C21867
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 08:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256181119;
	Tue, 21 Nov 2023 08:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZK7WsJ3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A94DF4E3
	for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 08:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4031BC433C9;
	Tue, 21 Nov 2023 08:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700556028;
	bh=KE0zJLEDNpcqrmsN+MDnbY+gc4hBNK1FZN5pZa1LnBQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JZK7WsJ3ij6npBzMDl2/htMh829Wf80N7m2Xw1CCbL43Ey7T3El9HpBLpMHBocK/u
	 Pfj8UWru0CVHRXsZqCApnfWD+C/sLUnZir8bJq4Gr7vvMy4QQ9Ci8Z2dbikKaPnmda
	 wcPKJcx2fEGMEinafJCUWRCsTafIsWUGJ2n8Tkc6xWb0/jAtipLT2RJyz/u4Jn3NAv
	 pwarsTG4OfVysBRGfdHbKmCqrT/zs5PwAk6KQNNKRTKbmzKoVtCfH2ilGj6f2YuwGf
	 V/hOHYo/qvchowds8IxqD/ia5PsLW5Ozw28nw8nSv7jPmFQ/XqlcSWIFbH7bD8L0db
	 +/CpKX2/b53mA==
Date: Tue, 21 Nov 2023 09:40:25 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Aoba K <nexp_0x17@outlook.com>
cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@jikos.cz>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: multitouch: Add quirk for HONOR GLO-GXXX touchpad
In-Reply-To: <DM6PR04MB412176BD43A29E1E873FB7E5CEA9A@DM6PR04MB4121.namprd04.prod.outlook.com>
Message-ID: <nycvar.YFH.7.76.2311210940020.29220@cbobk.fhfr.pm>
References: <DM6PR04MB412176BD43A29E1E873FB7E5CEA9A@DM6PR04MB4121.namprd04.prod.outlook.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Nov 2023, Aoba K wrote:

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

Hi,

unfortunately, your patch has been whitespace-damaged by your mail client. 
Could you please fix that and resend?

Thanks,

-- 
Jiri Kosina
SUSE Labs


