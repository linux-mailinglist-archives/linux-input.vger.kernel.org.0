Return-Path: <linux-input+bounces-2766-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7783289521B
	for <lists+linux-input@lfdr.de>; Tue,  2 Apr 2024 13:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 021521F21F24
	for <lists+linux-input@lfdr.de>; Tue,  2 Apr 2024 11:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996E46997F;
	Tue,  2 Apr 2024 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fyOFvxxJ"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F082C69954
	for <linux-input@vger.kernel.org>; Tue,  2 Apr 2024 11:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712058220; cv=none; b=PnW6ef42n7GEtYiIvc/KyOXy7WHHVVXqeXS2/EJP8FdwM0dgWLR7MGU5Ge+zmoGHBGAvW0G9EbaE7go2QMVwQgo7JBgGsof+BF3vjrtRkZkebOyAw6Ci5yJYRt41o5pl13EktI5OVWYhyd8/NnDZvuAAKFkLSbMrzBAVaFlO7i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712058220; c=relaxed/simple;
	bh=iMkAhuUU/al48UoHiTw/+mu5bf4d6o5qpZtlV4r74p8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gvZBYe97CL9nHgLU0TTApITjRu1aD77qYrL+9zhhVXHacqJS7SM60MwiFt1PZMHEYoi+d6MLICDV+jgI/YNikvvAOWxS0LO1Wy6OKiC2XCqEcyOErhzxPbw+iUFqiVNLYsLS1Yp7MG0U/mpYM3/2cZomSpadN1mbPUgdg7x3MSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fyOFvxxJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712058217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FXSimKNEDF9TDHj2e7uB69oP261aG/+4o76R5CJVdOc=;
	b=fyOFvxxJHsE5yWqDj6PXLFekjpE2zrFcbnOEjnGicr7gJNXfkDP9zv9ymuQ6v/FoktuM/V
	2v/EaP/CGlaAZevdAPTWnbxcUsfr8W1F5+Ql9xgMVn8Ew9kxcnjU4pbRDeQAZ5OMQijV9G
	8hln6wVqtQH70VcimawFC2WjUAmIVF8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-tQbzGI5bPWyEHYAUR_A5aw-1; Tue, 02 Apr 2024 07:43:35 -0400
X-MC-Unique: tQbzGI5bPWyEHYAUR_A5aw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-56c25ebc347so1680997a12.1
        for <linux-input@vger.kernel.org>; Tue, 02 Apr 2024 04:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712058214; x=1712663014;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FXSimKNEDF9TDHj2e7uB69oP261aG/+4o76R5CJVdOc=;
        b=fr2mTgaDN+6EL42gFt6sfUqSWYbeBqar+p0u5ZS/77Je2jmZiwnZJmT/gIky2pEo5y
         q3mE7ENUw0mcx1eOg/ahNyAdgUD3mM7feVe5nnCUyqnxJbIhqwC162Zr1XgPrQ6DIggB
         YSx4RWPMeAVoAXij7YFET22XEn1J4TQJZC3OlxCnsRivMO2Pgm3HgKGWatY3IQ9JlyX4
         Xz7tQR2bbDzocb+bP4iBBKmNMJ/LCfIAk9IcZpwd9NaoajTjMRh+q9HznoPz/piME+XV
         KMjRBlSLVCcZ1ryEECtNDFmjoVtpkoTbvjglncPR7xi0zBdPI+M29HOzxSyRuQY/dNgC
         SMHg==
X-Forwarded-Encrypted: i=1; AJvYcCXcJ0dS/jx/+q0pxAJnrDBT/obl9NKCbD1SrNa1/unoBsHREOC2FgLyj6073Br0oqHqJihK9238MOgitYy/PJHEE4Yg7h6aHqBm8tU=
X-Gm-Message-State: AOJu0YwCPjoEMpWUe+NFDRCXxEfpEgzf084xJuvgarpGaVUZPigcxalY
	lGdc3BrLp8xbi5rvFQO7vLG42BcxA37IFrUiH3LXTbaqVeK6hvFzmkhQ56bo8KJptn9qgfKfD8W
	eJPYbAYbQshulzLKi0CwF0g7dE+h8s8cC2opeQ7TSvHOJKlCf8mZWymWiKgbnZsnb+kqJ
X-Received: by 2002:a50:cd02:0:b0:56d:c721:d0b2 with SMTP id z2-20020a50cd02000000b0056dc721d0b2mr6216170edi.33.1712058214678;
        Tue, 02 Apr 2024 04:43:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL+DiNQX4odVVBWGVTTJDWVnJ/DTH5CCQEceUrk2SSaDUrgeEFnbBlJOVVZUallwSdqjNguA==
X-Received: by 2002:a50:cd02:0:b0:56d:c721:d0b2 with SMTP id z2-20020a50cd02000000b0056dc721d0b2mr6216154edi.33.1712058214422;
        Tue, 02 Apr 2024 04:43:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k7-20020aa7c047000000b0056c443ce781sm6662979edo.85.2024.04.02.04.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 04:43:34 -0700 (PDT)
Message-ID: <c5ee5eec-b00e-41b3-bbef-6f0d58d70d66@redhat.com>
Date: Tue, 2 Apr 2024 13:43:33 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] HID: i2c-hid: Revert to await reset ACK before reading
 report descriptor
Content-Language: en-US, nl
To: Kenny Levinsen <kl@kl.wtf>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Douglas Anderson <dianders@chromium.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240331182440.14477-1-kl@kl.wtf>
 <391c60a4-b86f-48e4-ba64-abdcb79d71ef@redhat.com>
 <cae66cad-e49a-4fa7-83cc-70aaf3346419@kl.wtf>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <cae66cad-e49a-4fa7-83cc-70aaf3346419@kl.wtf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/2/24 1:30 PM, Kenny Levinsen wrote:
> On 4/2/24 1:06 PM, Hans de Goede wrote:
>> One small remark comment below. In the hope of getting this merged
>> soon I'll prepare a v3 addressing this myself (keeping you as the author).
> 
> 
> A-OK from my side, the abort_reset label is indeed redundant now.
> 
> (The split between start and finish is also technically redundant when we always finish after start, but I wanted to keep the change minimal.)

Right actually for undoing the moving of the finish-reset
you could also have done a straight forward revert:

git revert af93a167eda9

My v3 is pretty close to this, but not exactly a full revert
since I kept your minimal approach.

Undoing the split however does not cleanly revert.

Regards,

Hans



