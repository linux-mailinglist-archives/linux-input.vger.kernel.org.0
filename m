Return-Path: <linux-input+bounces-3053-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 840068A5BC7
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 21:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F5DD283A48
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 19:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC117156899;
	Mon, 15 Apr 2024 19:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nx+vexuJ"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BAC156656
	for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 19:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713210643; cv=none; b=sogkRYhX080QRi0Ylnm2sPHhVzvhLjuZ6jqVdi3w2ilbCsf7hcow1olzEO9BYHKELxB7dK9j50P9DoeXT/Gw2vHeVbtF0aKyFWiJJx7spBh/0E+85NnSjraSnYQb7H7hBm+56bZABA4+iUAwW3JOlQUL0C6hOxrok3rKSslns1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713210643; c=relaxed/simple;
	bh=mu9CDbddqj1yG3DTgcUzw0htZFsVhwUKyY1dxFCnFC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SNnLD6WJPAxHh6MS6RueiLs7zfOoHJqXNPnLAZiHGGW9/PX3tae+MXOcmS6kzp7ZcHEh/gLniehkvvrY7gruMlNW4DIPncnJwPDIMy43ikOzZNoTSO3goQoPyYs2ap3NuVRFtpvepIIC907YWWq4O3SYEjoaS4Rfo3F+jpZ1ppg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nx+vexuJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713210641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v1GrzdHBx1Ad9AXyvk71PE5SXmynmZXwlPU0KzZCj/s=;
	b=Nx+vexuJRr5+DNP9DlzkHMBt2y6fx/Dmrh0AfcmhjbeRPrzp2sSoFojlVVIwrQbhWfLC+W
	q2AmVAb0EXX9aG2rC1rFTGVvXL8kJGDvjEHorwaEqkik77h33EXeseBdvYRUDS+w0p5Af7
	dGSU/Lxg/zdfWa5OMLXzg6nslNdpzjg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-arXRpJQ9OLaLNBMbW-VfyQ-1; Mon, 15 Apr 2024 15:50:40 -0400
X-MC-Unique: arXRpJQ9OLaLNBMbW-VfyQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a5217f85620so239253466b.2
        for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 12:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713210639; x=1713815439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1GrzdHBx1Ad9AXyvk71PE5SXmynmZXwlPU0KzZCj/s=;
        b=BjoYLRmtj+V0Rcwr4aKgzbvzWG470YRzLe4A7S4zr9HCTeqcg/2NsfbOXVcSancqzX
         mUmU2PI4jTNWBRggRYdeJLjqOdJjcZP68hqAjjTQJ1Q1yib5tBtGkVdVNCuZLcyMMt7u
         6VsTOp7Fd7ZZk6v1+2DHiyFZvA0TJmPHTKk++IWSwH82TMm4kDxSmeeoxvaegUVQVBeB
         2SR9r4Q7ui+70U8wCGZkMYNxcB6PBzMnmo8VwIQNFpMXLq0SvvZZUfWEiX+YHPLhRuWs
         If4IQ+8e7DsU1+LhNR4yJPv4qNJt2/vQsXY1/CPZRBarFEZ0FzC91nwiX8R73Kw1sdTt
         0ljQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2qGDAdJ1snRRBSvCPcOGD1k6B2ZcCG0gYZIcVLLOqmmInmztli8xHGmSdgqlnbxvVNMmnTbH1ap1VvbwV5K26pfNAx/SwqIQqU94=
X-Gm-Message-State: AOJu0Yxl7KirDaAcgDg4F9hIQOTi3+aj5jxosRGwY9UtgNca1r32BGJ2
	J17e6zZmyYpZCMQobFTCMJ0rbBd3BB9SoTglo4yCxuwxavtNiCF6RF2T3hVutAaqk5OkiHNh/zM
	5ohYrUogRPdAtqrtN2nxf7/SSMM4LAdFYrlBZ3OsPILcsV/V2tIH+H76O2bg7cL8Wtdi649U=
X-Received: by 2002:a17:907:31c9:b0:a52:4fc1:ea90 with SMTP id xf9-20020a17090731c900b00a524fc1ea90mr5109452ejb.62.1713210638735;
        Mon, 15 Apr 2024 12:50:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkw2/6umyRmgjkAwH2zmoEmiOVCpq7HOf5cUaBKrczviiqH4WXk5gSC+/1C1FS72qcWzmrbw==
X-Received: by 2002:a17:907:31c9:b0:a52:4fc1:ea90 with SMTP id xf9-20020a17090731c900b00a524fc1ea90mr5109443ejb.62.1713210638426;
        Mon, 15 Apr 2024 12:50:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bv21-20020a170906b1d500b00a520b294d9dsm5850643ejb.150.2024.04.15.12.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 12:50:38 -0700 (PDT)
Message-ID: <484638e2-1565-454b-97f8-4fcc6514a69c@redhat.com>
Date: Mon, 15 Apr 2024 21:50:37 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] Input: Add trackpoint doubletap and system debug info
 keycodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Peter Hutterer <peter.hutterer@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nitin Joshi1 <njoshi1@lenovo.com>, Vishnu Sankar <vsankar@lenovo.com>
References: <mpearson-lenovo@squebb.ca>
 <20240324210817.192033-1-mpearson-lenovo@squebb.ca>
 <20240324210817.192033-2-mpearson-lenovo@squebb.ca>
 <ZhR-WPx7dgKxziMb@google.com>
 <f3342c0b-fb31-4323-aede-7fb02192cf44@redhat.com>
 <ZhW3Wbn4YSGFBgfS@google.com> <ZhXpZe1Gm5e4xP6r@google.com>
 <92ee5cb2-565e-413c-b968-81393a9211c4@app.fastmail.com>
 <ZhcogDESvZmUPEEf@google.com>
 <91593303-4a6a-49c9-87a0-bb6f72f512a1@app.fastmail.com>
 <Zh2CtKy1NfKfojzS@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zh2CtKy1NfKfojzS@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/15/24 9:40 PM, Dmitry Torokhov wrote:
> On Wed, Apr 10, 2024 at 10:48:10PM -0400, Mark Pearson wrote:
>>
>> I have a stronger preference to keep the KEY_DOUBLECLICK - that one seems less controversial as a genuine new input event.
> 
> Please see my response to Peter's letter. I think it very much depends
> on how it will be used (associated with the pointer or standalone as it
> is now).
> 
> For standalone application, recalling your statement that on Win you
> have this gesture invoke configuration utility I would argue for
> KEY_CONFIG for it.

KEY_CONFIG is already generated by Fn + F# on some ThinkPads to launch
the GNOME/KDE control center/panel and I believe that at least GNOME
comes with a default binding to map KEY_CONFIG to the control-center.

So IMHO re-using KEY_CONFIG for the doubletap trackpoint thing is not
a good idea. But as mentioned elsewhere in the thread everyone seems
to be ok with using KEY_VENDOR for this ?

Regards,

Hans



