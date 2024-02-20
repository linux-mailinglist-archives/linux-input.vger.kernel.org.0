Return-Path: <linux-input+bounces-1968-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1205785B727
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 10:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 982C6B26988
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 09:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82ABD6026A;
	Tue, 20 Feb 2024 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GZMkmLF+"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB785FEE8
	for <linux-input@vger.kernel.org>; Tue, 20 Feb 2024 09:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708420775; cv=none; b=o5mMjaMAL584dPYMCBqSVynbRhxmmtWtqoBYZNv1tFagSonjDq95YHoUerCZTVYnuTIT6q7rC10ew8LDMfW38dlAZFmoDGWYam2YmRXVP8Ov5BIELQDAcqRQf83flzpmBVNdWXHvqPA7lpzWaOpbUGcgj5v7xOv22CsDOSkQK34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708420775; c=relaxed/simple;
	bh=QSKI5DJWNWiQUQy8PSHe+VdPXu7WJOu5tx0cx/gLfpc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BW7Xc1KpU2mUfc2eDsZNT/zbpAOhIDQbECVdF0lg9i4a6KQKwx6xKrHEoVZqQ9Cq4ra9MWsx7EarXF1y5F8d3lzFCvPNxsZuvKKYQAUXo0uWbt60aQNzm7hzkrl9fo2a6kEtXPbRRmrmlTlYoM7+KCGp1gwokU9WGXfcBCQo+Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GZMkmLF+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708420769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QSKI5DJWNWiQUQy8PSHe+VdPXu7WJOu5tx0cx/gLfpc=;
	b=GZMkmLF+XXP/JcDRw4m4XKQPkvbOVzQ6RrgRA6dcuVOd6XjUPdy1vEwk4ZoYnZMmwZTn6H
	ydnlnWO62acFeMYwsxC79soUC6wJYD914K+FUigWxA0ZPxfe66mUSlbyoFTxfmxFWjFWQV
	sGi+Rn3ITUje0yNWgnWaTsgIRdHp620=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-OqKHjcEMMUSC7WzZSFpoaQ-1; Tue, 20 Feb 2024 04:19:28 -0500
X-MC-Unique: OqKHjcEMMUSC7WzZSFpoaQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-33d69f1d163so159589f8f.2
        for <linux-input@vger.kernel.org>; Tue, 20 Feb 2024 01:19:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708420767; x=1709025567;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSKI5DJWNWiQUQy8PSHe+VdPXu7WJOu5tx0cx/gLfpc=;
        b=goexNvQxuJ/S8aStswQxVk7oBNQnTnyNYOHLghdz6Xqq3rbzIdh9AlLnjX1eqpU3aE
         sQvkt9s6PkXUslCgGn9ste5fSHsO2lGfFuTilAFV6BFBtwfyiPKB5NFPqN8az2HbhS4T
         bv96xmoUuTJTBJzDDMdoRtIR84sGG1eHUxc72MDWlnGq387iWV5CeybuJzj8AKcAih7i
         W5CcBuXpI0FnyBuK2G4EIiyoPwdxoCPb3SF+5QkKlWGNr9ETiP4EINvH8RP7+GPirIAO
         0blFRQRAfb9HY2UP1JWs5N81QjBnvGDZFpPwYjSK/vai/bqlFuuVIPT9kIP5JxqSOql5
         +mJg==
X-Forwarded-Encrypted: i=1; AJvYcCU7A5nfDXeGYv9u96ooc2Bhzmbi45eYKxDYX5RLgvsI08I7/aqNG68uPt70UxaB06VAoK8lsvD73epGeHndrXywwD7uH9Jojgv8ZJA=
X-Gm-Message-State: AOJu0YyUfgz8KZny2eC5yLv6ifpyzLgIpwy8UGo6y/e5NkUUvldzRUpe
	kaXqx0AXNtIsVD8WFBUrZB0DmHMEu6TIWJrEBhzChNwAtdi7/rXHdQKUXw9OpWtE/011TLaGRfX
	91PK5CaiylnuPmUbktCb9JiLA3oSPf7bK4SDdmNtmfj3XjbJQavHTJbVBCHsJ
X-Received: by 2002:a5d:6786:0:b0:33d:211a:7916 with SMTP id v6-20020a5d6786000000b0033d211a7916mr5926223wru.44.1708420766988;
        Tue, 20 Feb 2024 01:19:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTe50tTS4pbmxQYTMjD2j/YAzqOczhi1muOVjjeiUkN0RVGhBVXraWyeGB4LGC9gqQftjerg==
X-Received: by 2002:a5d:6786:0:b0:33d:211a:7916 with SMTP id v6-20020a5d6786000000b0033d211a7916mr5926210wru.44.1708420766657;
        Tue, 20 Feb 2024 01:19:26 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id ay3-20020a5d6f03000000b0033d1b760125sm13186512wrb.92.2024.02.20.01.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 01:19:26 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Bruno =?utf-8?Q?Pr=C3=A9mont?=
 <bonbons@linux-vserver.org>
Subject: Re: [PATCH 03/10] hid/hid-picolcd: Fix initialization order
In-Reply-To: <20240212162645.5661-4-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-4-tzimmermann@suse.de>
Date: Tue, 20 Feb 2024 10:19:25 +0100
Message-ID: <875xyjjxwi.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thomas Zimmermann <tzimmermann@suse.de> writes:

> For drivers that support backlight, LCD and fbdev devices, fbdev has
> to be initialized last. See documentation for struct fbinfo.bl_dev.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Bruno Pr=C3=A9mont" <bonbons@linux-vserver.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


