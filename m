Return-Path: <linux-input+bounces-11766-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B970A8A00E
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 15:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 940003BA459
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 13:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5BC17A2F8;
	Tue, 15 Apr 2025 13:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="V9cswZDi"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56C2192B81;
	Tue, 15 Apr 2025 13:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725087; cv=none; b=ijXUjQ1EEsLTiUzCG1Bgm8MKXzfF7GRvOAhzZi5P/GAsHD165x7Wmu2VsF7ZAUCr5lksTtqenGDlWI6dj/Tstd+xEu1Tcoixx3jFTtwiRpOLXiRheZiKM8pt1tAUxyO7BKFeQwm/ZQjLaA2YGsjnjC2NVi3gRNSOM7SCwlycQeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725087; c=relaxed/simple;
	bh=8n2irY4mS+vEqgM3wBbbGtkgY/tw4aR212DtcbvVKBc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=M/aMQdKEu5koE+ilWdWXaGMHyIgbhtTamzDtmOKYkDeBj8gvKrS/cRmGTqxVBRmWUbGUTY91ZC+lr4J3gNbk7RFPhyIIDKqXs1AbbQGmI81vMMA8zS8OFCzBCgLtiBkjQct9Rz3UehDJEvRrXtryiQIjWwIazwtbnWGmIUrovZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=V9cswZDi; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744725076; x=1745329876; i=markus.elfring@web.de;
	bh=JZpESOzQgOMXz3n6N/rlS9QElC6D9yfXuKep/LgjkpY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=V9cswZDitiBrq8+tu40NjiNt5Sxn90lVhZa9hil8NSfOKvNc+8dve5+GyjawvjLW
	 /IkN9N+EfvHFMelp7L1tgLy6H7rWexLZ/AZZYfHjFv7ROzbOlzYvynR25XVbhXV2c
	 kFztmQ9ApsBi7OM28nklYm3f1Qv83zZMdm3nmzvTzaU6Qiow4HS8NmgDOBYGpSAPc
	 9boBqQ+XdH++Ke3jnkyAa8hFrWH5ePjkfRYnnprGwzS3lQilf13hBGYsje/WoJoc3
	 AMfbQPbI2MrQ4swcz0TpMG3ZXjOQIIu0eBwt+pRknijP6Qgvg24jCwYzHUHEnG84H
	 VPBijOR39ds9ixKSsg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.24]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MNORC-1tftk13ieI-00TYSu; Tue, 15
 Apr 2025 15:51:15 +0200
Message-ID: <322ff5a5-bb0c-4ee0-9392-b6f33364963e@web.de>
Date: Tue, 15 Apr 2025 15:51:15 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qasim Ijaz <qasdev00@gmail.com>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Jason Gerecke <jason.gerecke@wacom.com>, Jiri Kosina <jikos@kernel.org>,
 Ping Cheng <ping.cheng@wacom.com>
References: <20250414183247.11276-1-qasdev00@gmail.com>
Subject: Re: [PATCH RESEND] HID: wacom: handle kzalloc() allocation failure in
 wacom_wac_queue_flush()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250414183247.11276-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:igC/SQJcUJ48kdycYmT34nc7kWf02h3S+bVPM9rzdYbW1QpnT2S
 SiYMx1K771qHLIzijora92vfd1nH073OgBvTVF8O9oyjyjXDgZc83nF/iF7Ff/E3tYAi2ZP
 58taIMToyMd9zNsyHBBG+HsTXs5qLTIi3ej+qUA65f30Rt8zoFE9aDqYQuUoaUn8vqjAV86
 ot0dIBaBM5i0HnqUa/fyQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Gfbk+qNrW4c=;tqIEsjSTtcGdNeFdkhWJ6A4jSDj
 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

=E2=80=A6
> from the fifo via kfifo_out(). However it does not
> check kzalloc() for allocation failure which returns=20
> NULL and could potentially lead to a NULL deref.
=E2=80=A6
                                            pointer dereference?

I guess that word wrapping can occasionally become a bit nicer
for text lines which may be longer than 52 characters.

Regards,
Markus

