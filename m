Return-Path: <linux-input+bounces-11767-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 755A5A8A091
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 16:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 988E57A778E
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 14:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02421B412A;
	Tue, 15 Apr 2025 14:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="vyhXM6Bf"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90A01B87D5;
	Tue, 15 Apr 2025 14:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725878; cv=none; b=pVZNvHU5x7OHzZWT6MyyRz7cjQpvSGhmLlVRPMoJ3c+7xrGV75/SGpXk42eIosJAGQ8QGedjoJRhnL/Jbd1zVr7gc0kjKyqR81f88MgnUSiwRy6MmcHD7xPIYpLtuCLyzq8+PI/sDMRkmrE4vZOGr3X6yoTQ5X9GzvfwiJyL0b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725878; c=relaxed/simple;
	bh=ea55Tu5A1Ityz28eMNQeDySsu5crZKFSigerdggVpnI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=ivVbDv1xxicDe26+BQYx76u5sAckTi389xqlJZx+/YgeDd7L6CLTUIYUl/YJyDrBIRK9XHCkRMVP84CSnnqelZJtT2/RmcXRzj0QYWlu4+SIUvc7aBmXCecfODDWcweTkxM7Oe1axFBoZS1GAfFy6uBUOeUN+5/pB93ukc2/0Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=vyhXM6Bf; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744725867; x=1745330667; i=markus.elfring@web.de;
	bh=ptDYtjkDBBg+5F9CH1aHCJjQZEHOlQKTSx5pXY1iPIo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=vyhXM6BfkddauOAkGfHvTIxBH2/ML3eFI/Z3ag+t0n9DuQ7Zop06TsADYuANWQkx
	 DQJ83NvneCdIYZesjNH/jUmI6sxJNvXfMcWW2Uewt3ymdUx89NCBsdAHEB3vw01vC
	 j0tuRTZgaFHn+NRXLEIfzbePpTMHdq8yF6lceZRJ3NFe9IRn69CJx48pyNj9203hW
	 oNCNaDkiK1bnDieyTEDXtP6IIRCF6EgsEeC8kNXt6ljOVEcv1G2EXu2EhJGLJSOwm
	 H+Zdn5j+A9JcfGbZCbJym2ptueVMdCbs5WNkG/1y1EzgONgrTxMolmYmMzSHcURfb
	 zbfoE1rOSsdqeyibKw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.24]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mo6Jz-1tFwfY1FAR-00hWEC; Tue, 15
 Apr 2025 16:04:27 +0200
Message-ID: <143fb11b-6e8d-4e70-b5fc-9d133e9be97b@web.de>
Date: Tue, 15 Apr 2025 16:04:26 +0200
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
References: <20250414183309.11460-1-qasdev00@gmail.com>
Subject: Re: [PATCH RESEND] HID: wacom: fix memory leak on size mismatch in
 wacom_wac_queue_flush()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250414183309.11460-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2SHZEWwLaL4rc1bGqN7NG1uj+SnhxxhTNeddATv+5/fbPr/AYwO
 n7iUly+//hZgYtGS4hEMi5yVrLZuySOUyTvQcytXjPbQw2iUJxYd5LI8NRe7kJdS6cCdhG3
 jAY61vzxFzcKrF4BHZnprfwK5ZQNUwAU6hTk8HHnWvh4p+UIhoNbY6HOo8v05GtvTvVyV+h
 eUYot7AP58XUv6myitK5g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NbO+guxmj0A=;ZctwgzcNHvvBnmSBVaGio9SI6TI
 bZWPj5a0+sBBZxCGWzziurx7Www99eM/JaCDbpDqrM/3qvpMGuY2uZDzxeOk7qfTjuE9vsSZz
 aoz1jFqeYPCh3wDCwbKY+fSu+fodsPNb0Fsi2G5aUHBMPNfZGe+hIDhQC9sbsfKtty6tpIR/K
 M2LjX0imRUQLLtXuaT9M3QP5tn2YSnUVCJAb6wjAHJ1l3hNwPkU3jXrJLmx2RwziZKG/oxxat
 W+JfJYefjot7e/Qw2YE+fSiH53upW1nsem73KrOZ2E6dkj7QGwaouopBICXwiTgMBK07dZL6x
 lDsoS1GwlV6WrtL151nEuh19Ei451oDvsSnGJyi5XOiTW2G1oNW3510kWSLUf33Kyhfs0in+l
 wZrbuhDK34cfKnLeT0At63JYC3VYy4Qv4F8Bj5B/e2TCv6Qc88Dy8T4fSC6vQDQmhW+u4pfL3
 p5oxk8+nHZ1K241Vu6jyNIh+4dAQjcIXYrqV0d0hcI6Wrtmm8tfpv5MQk5o4dVOvl1brF3Sa4
 vgBBZTpTeNZrPlg3Cwi/ZbmPPq2SjwMlJO8v+YHcoM4+LFG0t5Z7CBxaWQCXqHIX3LioPRLX9
 rW1Sp6itORqRkN8rUeKgoCh/rWc/38ZEBhfO4dW+VbSgjW9XQJ1+W1cdTRt0odgu2OxOulpA8
 BFg7HfoDw29WDQtorD70x5nJ+HLjUymh1l15mIZPDPijnLEId/4oLtFeowXFozDr5PXpNF4x0
 ZMT0OPS25QK+2EL4oEzHHuraBKl0GZk8pifBTFCD5sYTFB72ONiUv8fxif2AYjA8GMVNnAs2P
 d3EcqA4/WJs/hGGRxjcylR9MeyTC/koBokPWhUqOjmtiEEk4le91o+m6zIQrD4UNUIIKc7SeD
 LkKRSqg9Bs2GOtKPJ/3Pk+0vCcmkNwIGzaH70hlHZirUixWXAJl9IMOZWXN794qNuzTPbAGcZ
 oDxGskwBkaBrjNyzghbpUdR+joPAmnPNtSe1BUWf7LTKb3//gr4PXVpFYiXvu4o+MrvTZ4e+d
 sFDYecNG2o8hfUJXmwKfeQcVrmFgH4yVeEk6OEcMvxYwI4bSzFWQMcRW6ic5gwrQo2XGhgk8i
 gkNnb8XbELFyeLlWTqVktviIVLZeBhi+8tjzM8JJTs4J93yGNhpwyKupk1bwM7SyLdLSG9jrJ
 BS2YuXJBoWEhKXFVq28WHVj9DuViAsOlQsKlKDGUTwBB37xf4Hc6Fj3XSqXsPydHRkbJY2zIp
 czLJS/EakDhK6icchcrKgXAPD+e7an53WAQsUL4OTdqhwLasgSQfwKSt8X3bJMDXjxZrc+Ine
 HKJhWlLfsYVFDCkNqVPGZ8nQrAHqt9J02EbpnmwP1hx9XpyTs0arBuWwDeRY6ArjEV8mnwlcd
 30NThI/d/AYN6htsEWLnuU7twLFtx5vnU6/7hTfeyNMLUUeTqwWsT8naxq5a1VBKhSKl7359Z
 6HzpxdsNnZ1Q4JykqEYWTabiPfwcKBPYt21rD90kjfb9iO/kXMGs/fvBxaX2lJBMfjx/ZEhyt
 Qo1rIUQI5tIPGfBtWoxDsYagGIhZIhyQ1v44Qf6hbc3Jd0wJ66XsU+ssj7nZxXZ7HEsPQS3f1
 P7suGWx1hSGm7DVwyg8jJEZUSv71fhTptDbMWqkvrmVefuuuhT/Ky7njfBKE9q4CR2/VoVF2F
 sETeXQTOaysQ1QJryO0ZTOmIEOBzUfnxekrWybksakiO2DtLCiwc6RImEEVxNckZxBtJptfRl
 HxdDRtWu484dnuUf4IG5RI+TVdPfAz2nG/jkNzGuJpEJ1M1YYoklHsNLfxwPlP8a3+NhC3MxW
 L+QX6tNvvglnVibxcIHzI07ACYJvn2EgcHgseJi8OPmzrNtWv8SCWB/8BJSaJKyaSxHET5uYV
 G1y9jeSQtvsJr4zLc1XKI2IJ+6bJgvFzI7YDOmM37Rxa8E/rRtuaxIIuR4bPPPPp7gv91jHx3
 +s551g2pGuj6BuTKiK6K/G3hYHtD5KNvX/78dBpksDVZYLh92tKkp50Dg+LqIudweSSS7pQVt
 lT2rIFon8QM5fyyZyB+9kfMDga3CiqI9IMhVOwyKjrAv+LlsPrsOZXvWvut2nNC7onLKVykmq
 olRa4ScO0Hbve76AW6jFn3XrQYqCVcqSotKbjs4GDJ45+efsovM0vzDyT4VyoPvvJF9KhLU85
 AM9A23WNMvuN2aAxTISvgoU7exz2wa2rIyyZnF3OkA8S9iWxb6pnCQYYdfgG77em5gV6HTegS
 j4UScd1+jHoZrL1Fg6h/rBJee/wu/hfjIVovY7DncD4eITsGPw5EKJ0bWCH98Bfo//1gTO8lW
 wWs+R1oC1u7E4ZlPs5q9X/TSjC+89XhjkTVlWbj+cs05evr1q0D+qswqGcm+D9CHpD1aq7LdQ
 gIyVX4XSS4QXMDHMOeiOUQ0oXcarj7z9lNMHCfPCRG+uE/rAkAYS/bT6jjo7DfQ6pF/q3IHTn
 bIY0pkF/gKhc0p+7T59YzKi6xkIVrjQaP2AlEyKRBu0WCTRUrV8aF0JDpzUT8Djs2HhDYgJsz
 Y5z2Av4TZW58qGukOPungK94K8j3KQ05D4qub+/NpFxclWDX+PVUFsl9sSYXZH/iNdQnUkk4/
 59FQ1pALHhbkeU2rkyCKKivvybF/Cwy1N/AtvgXIUHVH1XbWsT9k+meX2QNGTp4ovojxjJAJY
 cOPikmmLXtVzbioCxvCLBxJXZ09/XDSkNsQWqZyBYnQaogrRbRuDyhVUAYOboLGibt6kv8C6g
 EiSHJ9uqTbahWBJ+8BAuTQ36EJ8dsJcpwjyLmbeppHQB+zMu4LAyzuTZmbz6N1TWq1QTqKPGJ
 xfEa28EH6q2oaQj6hVg3csBDhiVNuqZPOY5WZJubrIGg9L9JPhVRXKrOiwOe6ERZfVLKgRo/L
 5W0yTvlvY79czKF+wZYGp1SqXSX3CNfz9+sWvkWvYfKirl/guj2ZRsrIQ1+AW5aMlABztmgyg
 Il1zPos7Mc0V/gCpcX0L6WUdow4Ezz8JA00wJxd6TV9RijVc0BlF

=E2=80=A6
> number of elements it has copied. The code checks if the number=20
> of copied elements does not equal the size of the fifo record,=20
=E2=80=A6
                     is?

Under which circumstances would you dare to use text lines
which would be longer than 63 characters?


Can a patch series be more appropriate for the affected software module?

Regards,
Markus

