Return-Path: <linux-input+bounces-11359-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0528A755D1
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 12:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFA761706B0
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 11:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0590618DB0D;
	Sat, 29 Mar 2025 11:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ZQlwAFQd"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2FA1ADC7F;
	Sat, 29 Mar 2025 11:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743246208; cv=none; b=DVMmkHCwwn0nib4P6+pvV+QkXrWHdtmxWRj649pe7BSNPfrhPub91QUPXiFGKRwubwcFC5HU8PO4QDmXrqdBodUSupz1563LrGcxKnV2NDdSRel8vVKlAeicIOoPKsQ8Ha1zUJ8QSJZBjV5DMvSqOQhQ/d0kTvfdvJla8Z8yi10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743246208; c=relaxed/simple;
	bh=QRi+vISoeC7R9nMc47qoHfWTH/rS+6vpQOSxq+/ZXmo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=dywEfgmj9P/waAxk6CWOQyUPMc2HzCLd39K3+Ljyg8Ag72jf4UAtNnanl7krPJNy3dLPf7oy3yj01qPhtVyvjGIK/vJ2KFy+FWEc2tKyJcHAvaLdTc0V+KfKY1EKsuBBoyKzE/MJCm67LbwqA34Bxl5Zoi0M7vkaEZnwDYAM0QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ZQlwAFQd; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743246198; x=1743850998; i=markus.elfring@web.de;
	bh=UUR70NCAx2dPdRQqXXucnaqxLPHJ1CdLth3SGiwjIRY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZQlwAFQduciEH6xlMOPNNkT6UcZ9qx2mlRW3QQqBHnoaViiUtbqX2nYxAxirQ/Wy
	 5YobgO+woBzrtvHFJJw2ApugLTuEpWRfNQ5joZzwCOWtx17AZuZq3ZWVCcgqa/eZE
	 Uepv/a2126lhxbqJkZhTfUGEe8jYEXfQ69hbKzPC4VzlEmXNFYGHgvTmJKWfnJqgy
	 3xgog0SNuyubhS4Qu2eBonEHl1zeDoPWm8PaUFyL6LrQjxWcTt+y9XpOLfR5T470g
	 qYC8SDmmMoEsjdoWKc/d8jHuTj+xEg2kPppR1fHRsLXF3XN+ncZ6SRRG850c/L95H
	 idvFOaJwdCpBDn0HMA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MkVsa-1tGwXY24B4-00fYKX; Sat, 29
 Mar 2025 12:03:18 +0100
Message-ID: <52f59232-78e4-46c5-b7c0-4719811ec8e8@web.de>
Date: Sat, 29 Mar 2025 12:03:16 +0100
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
References: <20250329002003.36600-1-qasdev00@gmail.com>
Subject: Re: [PATCH] HID: wacom: handle kzalloc() allocation failure in
 wacom_wac_queue_flush()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250329002003.36600-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JuAHM+NNLNKqkHJu28wE+K2X20KfUzcuywTOyVR/sfVLkurhTNc
 JoewbF+WEfRH3bSInIGYqIPJB1xWOoTIy50AE1DV8FuFFNiiRYvfG3a8KVQkh0LnYWTxoHM
 zN4og/W1zY31jlUibwgCR44rGmvPNSNBZX0M42WrB/ytl112CFaRXR7WPLqf7+hvQrRXAAs
 BRLL6Kecu+KkhLhSnNAiQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fW4EDglBUa0=;VXf5TctnqQlb61rzE+NR/SJiZWC
 pxUA/ZH6ETMO8CH2lCv3TGBVpf+DiGoi42Y2p5GwIG0S9jJLtWKLKaapfLxo1TrfuyCNvYuH1
 CTGf/EyMJjl832IZ2plGoP/+GfXUVLHo6Ez8085XoZiCliV13rKfZXxsz82BTip/SZDPGcFBa
 S36ynyVVu31lRKASz1cReGU/DVOcJjfSo1fIaIEWc6lKczdpm7h+WMWNkUzL3lus9kY371au6
 OMyK03RQsVXAN1rRhJse/UgCM9g28TKQV8jb7hI1DsIBIVP5Kl5uEm+7Wk5qvA2zyHx+s0Fh1
 F/SvCcq/mvgxEZKg+esf14PJEjaht+QzR7L75Z1cbU5HUfeLlZTs4BV9hQcSxHm9nluwsmfRF
 LBdlnqCNRlPWz5fGHmkEIp1UBsFGqQcdC/DAdY3HhAwRiPWzS80PiD9EKceCEavoPtVRl0ylV
 rQhs0uEewlkn/7ZUN083Ka1zsVEETlqWPeuzb18R5mGJOWud54FHjbBYU6nKY390zYnb5cTPq
 3WTjgIKGkV9xFbUMVAdmxszBxvaMYcmylFaIxGXTr5PyNR1uW20N83eZ8o04YzZVY+Ktxem7s
 u4ZIJHag4RXLXdegeNcan61mx97o9c0gnZQAWbIRNmoEB1L0ixK1qFaoGeMVK+fQMS6DkPrZc
 bWlwbQVQyug7vnDkS8gq+2qhMasoHg8oMlM1dUIMrVCooiV/eEBf0vrxMSmFkhRq9DMbkWez1
 Kj7q//OVYjNzJXpC53JhQWMTCuhOOfkyOrqTDeNWLlBipvzVcGm6NO92ykK5NdfNFCtzM5nQ8
 JKTUu5KJr+tY3vjaScdJ2qhC2F2vo6u8aeJ0abuJtknLP2kE6sLzu+WRCKZ7O9zIWeEJuxxxP
 4nEAkmE/gWMOF5ZjwqnqYwS/JgsMg1DisKGm+Dp8DvLG4hcJ1BE3+0yAw1WX11yB0YKpRUiP5
 yokAJYtbl7Yp8hUiwFssHlipZeP5l71YSYQ5CGJhRfb9Yo4d9+bGhnhRM7R+gGTGiUMHwc0s5
 aQPmk4r/mpVJLFK/IJZZ/rmrLt+ccD02Q2vOZVXCUoUbggFbKqMjgl1SdLsmMi7HSQtJ5DSal
 ud4kFuKzwmSFOe/FsJgZrS5TZTJ8OdBYSC7CBtOMhqklaV8P8tmL9yqjuCRzzEXNuR7X7O0ZH
 40u9zkitjm1IF3vJZoeTGWf/X1CkcloinuwCe/rm+xOKizzNajCNejcX38tT7or69xXaaXQAS
 wvnjtUjcIMQv/WTGpwwpeIfaX9CIxhMpJ0MdemlXQdLqwsa1VoN3dVS0R40KkXek7fWpQgfHA
 9MPLqq2f4TGICCQoNgxN/HF6hXPhjZagZcrpG22F2UNCj7vhavyvguYfYKe1/jxOdaSfMsLGM
 Roqq7qIinu08r+XYc1IbwNb5wnQZ3yiafN4R020PKcU/BwPtqnrnJSyR9kga4uuJPEGbL82Dv
 hN0CZPGtPKEOcwkAcFFV4ozw88UBqEXSIAuKDBpcyeUSPGJwZ

=E2=80=A6
> from the fifo via kfifo_out(). However it does not
> check kzalloc() for allocation failure which returns
> NULL and could potentially lead to a NULL deref.
=E2=80=A6
                                            pointer dereference?

I imagine that word wrapping can occasionally become a bit nicer
for text lines which may be longer than 52 characters.

Regards,
Markus

