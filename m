Return-Path: <linux-input+bounces-15067-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7BAB99FD4
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 15:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06A1C3B1CEC
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 13:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7172FFDCB;
	Wed, 24 Sep 2025 13:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScK3mCTe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852F72E0B73
	for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 13:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758719679; cv=none; b=NGPzPENe/gHh3OB9+/ecRfXysUilpaEGhFsVBrIcjBhbmEMcpFfa/Vs6NZHmv/oJXOH8lOqF4IgMNre01DcOlz6/oVb6cZivFQKP8XPCtPm8ZqB7hy4G6sHWe6FodT/hEm+DjXNXg8oESwxEvnkClLKq/OjO2oTzOVvflRv6zlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758719679; c=relaxed/simple;
	bh=VZv/R+Lydiru7NXai3Ae10i1fqpu1CG63+EFMARw2z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hg50q70R00QrMd2RMnrybA2LkWk9J9kG62r+vd8ukrn50GRI/++SFp5uZ1xUu5jfS2WoT+2IpIoH8ZzaXmAR7CGXLKPPu3Sdeoo/kTYho1iXabNCkuxBKlQAPg0A7Fl7zZN2WjdUx2UA76jhJQMkcf6SKToj9tfhXz5Tt9QSVqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScK3mCTe; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-85a4ceb4c3dso5465585a.3
        for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 06:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758719677; x=1759324477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZv/R+Lydiru7NXai3Ae10i1fqpu1CG63+EFMARw2z4=;
        b=ScK3mCTe+VprXhahFbYzMHqB5KcDauoxynO3vtOkpovgORSM+X34DQXz/P5GGmieY3
         mursmtaEitgq1nUwju5w74m9TWo1S4leSiCkuNDy4pYODwj34dWTneHBsA0Ym5DvGXdI
         iFRGp84pfYohzcAscR46WHHVTjxQcbE4Dl/wMwpm5auNPMdhWhKv1jbHITNl2OUXfHyO
         qKZG5xn3Cn7UAKKgGebK6iBWgyjqu1KTF5gKOm2MQopnDJwxFXdsoiTE9XJ8YqBYxTfs
         9Qtf8kUWItUq6wCxy8Yonu1Wv4G44zOW4dotbM7fclPWKftTDAuBsv2TFphm8Io0yVUF
         a+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758719677; x=1759324477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZv/R+Lydiru7NXai3Ae10i1fqpu1CG63+EFMARw2z4=;
        b=rCdyTf/o9XGbUIaTlIqTtuftUL4AETJ4s5Kh/9TbWpCfR9wolg4eNNGoQDFSHNkpsI
         eyr7n+5tnOTgiV+jYvzDsNZbMOyFxYfhOmfVaD4HDkAOBt60kTedDE1i/OrOk+23p63T
         Etf4J9TRnUnCyNhaee6Q8Lxt4JmmP7f+ziRTG8lb2YykZhLqiJf7Mel++puHUtBQdkKD
         NAUD5zqQDZHtjKEZvXqghuuINLnhKr/WyvsBw9dmlmg3nz34o4RPGCLe32QfRZtjvi+g
         e/zG5sordzxm8QJa5rdR215TUk2Bfn9ShQVD6zEqbdhltGelVv2TZiIJvTIiL8MDGf7O
         dhZA==
X-Forwarded-Encrypted: i=1; AJvYcCWRGcnjuX3BONEtWNrBatnoV5uxvDeCZz6voUQSAiksoEwtydlqnTSKIYIj9eg7aA3rDF4RqbgO+plBTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpExNapXycEF1EWwut4lRA7AaKaiEBxfdGnI34yd5uVUPF6mt7
	G/Xkk8sRO2wbtbAR/+OMGTJVnuwGlIiiDig1yQs6WOJP0HLWJ1i81u5TQjxAM4hmyBSq52yVxOF
	EkedOKpYQb96bsF4XqQewBwGHZjVCFjc=
X-Gm-Gg: ASbGncsLf0qBJyybWz1UpJ4flvlhXNUmOms2C9RX1gjO0uCY0VjgoOFtKQbt9W5Hqif
	yfYBBDRDIUVyFOMR4cwxdkzCpBZE5s3UJfqjnZTJhvaJi2wKjPMot+X8cJKDCpH3NYytvlkV5uc
	W3Fk2jyiz3bakCvgUe8sbwDHjMETtRltOHsJlB06Q/9LlYtyVD2qbQGSVZ5+NdmtPbCj2QmeGx+
	Qc1q4Mt3PbnFrCvsERZh1ENQAcUvAR9uZ6cjQT6fgNAg+NCbA+z
X-Google-Smtp-Source: AGHT+IFW5ydJGJomVZSTmzV+enpMyryQsOja9EMJNFRBeWC/1HSTHy/94zFyhyeJUzCqfTu1dgMklmb7QbHYZ8VrMBg=
X-Received: by 2002:a05:620a:d95:b0:82c:b307:bce9 with SMTP id
 af79cd13be357-851760476eamr770911085a.66.1758719677227; Wed, 24 Sep 2025
 06:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEU-x4=Zs22b5LX_rsBVMu4BxvDfO+CZkkuWuVNaxv8mqvh9Gw@mail.gmail.com>
 <bjtev7sgmcafoysd53xrxih4nawn2dbq4odylwdglbub6td2a3@nhoxenprhjvy>
 <CAEU-x4kL45DAddmNahjR2C97+43jchpmXep++LbeP8cXLEWN-w@mail.gmail.com>
 <CAEU-x4nv3XnXchevtwN5mkVcxqnpgBobhavxZc7BjS7EgYG8Ng@mail.gmail.com>
 <c3plpgl2zsx4do2odwdeowodkkdnfqpexlwqg5a5mckyibxlge@qai35f5yeswy>
 <CAEU-x4mJiBM_zKg1DaeJkKB3W3Ay08bUTc-D3QjFjDxNiZGd0g@mail.gmail.com>
 <iav7hzeaarxifwxk7zlfnt6vipqkp4h4ldt634exlvcswz62gj@a7ongaeduylz>
 <CAEU-x4k_56w17y0DOKG2TRtegGvzVKS9USAERMa1MtO+3wZivA@mail.gmail.com> <jm3z5dcgw66lzh5bbhnitnchbvgnvuvrzxltghrsmwtmbg76jw@rcvcyjevjrmq>
In-Reply-To: <jm3z5dcgw66lzh5bbhnitnchbvgnvuvrzxltghrsmwtmbg76jw@rcvcyjevjrmq>
From: Yinon Burgansky <yinonburgansky@gmail.com>
Date: Wed, 24 Sep 2025 16:14:25 +0300
X-Gm-Features: AS18NWCPMv2tgalE6efXx36Z9UYxW7tQoHsVEql15JYZ8XgpNe4cJCRv-ZgfGTY
Message-ID: <CAEU-x4=NvWYPUas5e-V-uLOHiHu9Wc3CHGLwTbKPTM1r3+U1Ng@mail.gmail.com>
Subject: Re: Touchpad multitouch leaves ghost fingers
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2025 at 11:44=E2=80=AFAM Benjamin Tissoires <bentiss@kernel=
.org> wrote:
> oops, yes, my bad. I forgot to put the correct group on the device
> (multitouch_win_8 instead of generic). I've force pushed a new version,
> so please redownload and reinstall it.
Yes, now it works, thank you :)

> Now I need to make the kernel patch. Ideally I'd like you to test it,
> but worse case I can just replay the recording as it seems to be enough.
Sure, I can try, if you give me instructions to follow.
This is my current kernel:
```
$ uname -a
Linux fedora 6.16.7-200.fc42.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Sep 11
17:46:54 UTC 2025 x86_64 GNU/Linux
```
After installing, do I wait until Fedora catches up to the new version
and then reinstall the kernel from dnf?
Do I need to watch out when doing `dnf update` that it won't override
the kernel?

Thanks,
Yinon

