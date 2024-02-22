Return-Path: <linux-input+bounces-2036-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC7C85F5FD
	for <lists+linux-input@lfdr.de>; Thu, 22 Feb 2024 11:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7881DB21C03
	for <lists+linux-input@lfdr.de>; Thu, 22 Feb 2024 10:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8712C3FB28;
	Thu, 22 Feb 2024 10:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fCJuoWsX"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D703FB03
	for <linux-input@vger.kernel.org>; Thu, 22 Feb 2024 10:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708598771; cv=none; b=qKQhcj4VkQkaBZ8y71VXB4thpmPZB+nq9kDglG1Qeq5t1/X5ZcclupCOLST/z3+j5cPTpStJFIfr0nxaMltUyiQzB4zoXn4ee8aDXiB79agC+G+K3pVNgxUz9VTmqU5NBkU/+NYpsKwPJwvrHgU7Xb8zkHYfJxV/ZBNEjF0NLlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708598771; c=relaxed/simple;
	bh=WaHYs3tDNZ/6FRp6sSZMOkSoxLkY4gIfyGD/mvLGRxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V7rMULELh8ju8PvA9024PJRWEjEKcYwx5DycvqUVXdiIztkaiqtmprsVhkTT0grL+++SsELshPbsHSvcXljBZN7bVX03vdjC4EcXRd+pE1YhgcbrL9+DPDrZ94exmRotQjqV13fne+2PMJgPF8teCiHZST2pis0mrSS9y70noBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fCJuoWsX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708598767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rRPR8AvutOPFFWYPFI0BFk7mX8osS7DuA7SiNt9M+vA=;
	b=fCJuoWsXHEIrUln+yD51r8zYAsK+r40Ge5ZGp4ms59CUEkcCntx3JFHNuoPCpGqP4P2yaF
	ZiQmixcxJczWzyBzXQprHg843E7NHWTs4PTlv7fQd9SN3b1ZsbgIitix+NNQX3uYkcD+dN
	9ywrGK56i18+BdwciOP/v9UTyWzPltQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-8yPYcQp_MWi5-cV0wI_GPw-1; Thu, 22 Feb 2024 05:46:05 -0500
X-MC-Unique: 8yPYcQp_MWi5-cV0wI_GPw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a3158fbb375so378418666b.3
        for <linux-input@vger.kernel.org>; Thu, 22 Feb 2024 02:46:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708598765; x=1709203565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rRPR8AvutOPFFWYPFI0BFk7mX8osS7DuA7SiNt9M+vA=;
        b=MfF8VkN8L6i2M1C/XS8lunnCixEgGiEvv1m7+/duIpBuOZDN/Qzpc0/7tdQoNCaoqc
         aNw31+OIPYBnqKotteuhAtJA8MiOsWiWoratYUK9JpcmT02GzTvRWO0GVIktCJiaPr4H
         4M+4fRuVEOzDqO6dZw7DLv9kfJzsRUqLQXhUjFyrCxy6s3vB022lHVmvR4xfyXA4kzMK
         C2aEhTAevGxeub31vyCx23brESZCn0HUpD3K8vhdkueh7LPM4/36cPuuM6DhneBiv86f
         Ya4QAqUhO535/D6p5JbyreukWiLj4fVyzjUkn9a5tUfjqlFaR+DeIGBS2XvT/H2b9kgi
         eLUw==
X-Forwarded-Encrypted: i=1; AJvYcCV8lHfqlGPfYpoJaubzg/CaK+tiSmgTgg+tCrnfIA0sf0FC2XBr+gFjZdMU4yobtrYZJR6QpCHjTDaKplBVFeyCjHsHrLBcq5Dxt5M=
X-Gm-Message-State: AOJu0YxVLVWXt6jdECFi7VQQyh3VyRc799glaBiikYbQHTwbHT9WdoMl
	pt46mvaF79ZCPy83eBON1IBaLUoMtF1+/JwMCgP7cwVbz/2hYja7KOn6qkeDGC8cWtX+DmRY7gO
	Tt/bVLmeayOb4zVD3VdPGkLWzIz+y2hCj7N9wh4ZPL0Sxyi8WWwN5nGbh35OM
X-Received: by 2002:a17:906:4e97:b0:a3f:7fac:6ad2 with SMTP id v23-20020a1709064e9700b00a3f7fac6ad2mr957875eju.52.1708598764829;
        Thu, 22 Feb 2024 02:46:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXxoBT+ZeY1acRDGAGZfFRUc+WAMjs5U2qUzzkSwUQrrqCnfDJdHUdJj930KHBJgZvV563bw==
X-Received: by 2002:a17:906:4e97:b0:a3f:7fac:6ad2 with SMTP id v23-20020a1709064e9700b00a3f7fac6ad2mr957856eju.52.1708598764441;
        Thu, 22 Feb 2024 02:46:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ov28-20020a170906fc1c00b00a3cf9b832eesm5810587ejb.40.2024.02.22.02.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 02:46:04 -0800 (PST)
Message-ID: <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
Date: Thu, 22 Feb 2024 11:46:03 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Future handling of complex RGB devices on Linux v2
To: Pavel Machek <pavel@ucw.cz>, Werner Sembach <wse@tuxedocomputers.com>
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org,
 linux-kernel@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
References: <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2/21/24 23:17, Pavel Machek wrote:
> Hi!
> 
>> so after more feedback from the OpenRGB maintainers I came up with an even
>> more generic proposal:
>> https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/3916#note_1753072869
> 
>>> evaluate-set-command ioctl taking:
>>> {
>>>     enum command                /* one of supported_commands */
>>>     union data
>>>     {
>>>         char raw[3072],
>>>         {
>>>             <input struct for command 0>
>>>         },
> 
> Yeah, so ... this is not a interface. This is a backdoor to pass
> arbitrary data. That's not going to fly.

Pavel, Note the data will be interpreted by a kernel driver and
not passed directly to the hw.

With that said I tend to agree that this seems to be a bit too
generic.

Werner, it seems you are basically re-inventing ioctls here.

If you are going to use per vendor specific data structs for various
commands and have those defined in the kernel userspace API headers,
then this means that userspace will already need updated versions
of those headers to support new vendors / new laptop models if
the commands change for a new model.

So what you are basically providing here is a generic interface
to pass a cmd number + a cmd-bumber-specific data struct and
we already have that it is called an ioctl.

So I think that the conclusion of this whole discussion is that
with the exception of a get-dev-info ioctl, we simply want
vendor specific ioctls, using 1 ioctl per command.

Given that these devices are all different in various ways
and that we only want this for devices which cannot be accessed
from userspace directly (so a limit set of devices) I really
think that just doing custom ioctls per vendor is best.

This certainly is the most KISS approach. This proposal
in essence is just an arbitrary command multiplexer /
demultiplexer and ioctls already are exactly that.

With the added advantage of being able to directly use
pass the vendor-cmd-specific struct to the ioctl instead
of having to first embed it in some other struct.

Regards,

Hans




