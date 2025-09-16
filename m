Return-Path: <linux-input+bounces-14762-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD2DB5963A
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 14:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98FE71688EE
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 12:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45613A1D2;
	Tue, 16 Sep 2025 12:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6jejKYQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9B0298991
	for <linux-input@vger.kernel.org>; Tue, 16 Sep 2025 12:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758025862; cv=none; b=sXxBatnHvWvich1yE+5f5d941YvyMXkh/gcsopInYDpwDT6KreoUyxHapEU51kkCpjnm5YSWdHP9nv4NURBoGLf35xXWU56vhXg8OKzwYqkwlpd/tBD6rrS2sVakkRYQVqd0AFTtBFoobh8CuV+ptGIZzU0Z6HCceOrTylz3zd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758025862; c=relaxed/simple;
	bh=lvW9nfQdoxpD42EsZB3J3TjaQcRdFwDTNQW681sk0V8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eD0sTF3bH5Lq4Fq6Dqe8BzuBsBtf2NqYGux/eOgPxQhLY9W/uhJg70UR3wXn7eQ62YIqAREerBYMTIhXXCHGw+6AdDNiuUoO9gbMoP99U/H6+U5KmiUdhyCyh5aJGFTMqIAvpnrAq/9D8WBYZft+qET0F5LxyR9/TRMRij0G9OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6jejKYQ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ea3d3ae48fso1516313f8f.1
        for <linux-input@vger.kernel.org>; Tue, 16 Sep 2025 05:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758025859; x=1758630659; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lvW9nfQdoxpD42EsZB3J3TjaQcRdFwDTNQW681sk0V8=;
        b=E6jejKYQw9UGua/I5/nD98a3PhpSq7z4ohJkcu0i/OFSSkCcs/70UEfnhnuhWiInYw
         jKoJr1IriXcxFX1+JHUEfq5QRyP63iHjmjhsbX94uNkCpoBBwjPeelzjgIkSLr05yrVg
         aX1Del/RdN4Ripah3h7Pf+JrGd+W0affFlGf7oEMkYWA+Ft5y2CRn+AJKqesu62cBAig
         O9WZ5Fm5my7sZHpKUy/llL0S/Vs7Mj3BDL+12qIGaw1qGYCRcrPnVYvgtm8L0/fhaT7C
         zO0NwJzqS3vOmjPUzNLnn1AQ2//T91FSJvX+4947C92OjmjufPFE7UhxG9ZG64gpO2In
         Th9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758025859; x=1758630659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvW9nfQdoxpD42EsZB3J3TjaQcRdFwDTNQW681sk0V8=;
        b=Y+Ag9FzeN4KZrSEqFXpcdoeCrmVcj9nxL1AO5FjARY8sKhHfvRuL7tZ0Gx9iH+oCWE
         1YUHr+rJg/+0N9ZqMNS621ihWVhn5BBSaJaBlS2+JPJ5JQCcKpLmZX9h9rjM1fhPKNG1
         zsQ8AjE5YdurYjiiiCtJ3qlAjiujh/ouK8a8VKcxJ7JdKal/XwCIOgdNkU+oNQ5UMudP
         XJ37T3U6575qv8JqkTn6b4mNnat/XQ1l974Aqjj7c9sHYnq0TWLtlm9Lh/K9wsMwKQHY
         2Ew/6ZItFXdsU//AcZ0ekYlc+nbr+/vI158QX79m+OCBBF8yC7xYg05+wsHVKQy8KFFy
         p18w==
X-Forwarded-Encrypted: i=1; AJvYcCX3Ojh2y0QuBMkJVzF6xNbr5dlyzG2uti2oc6NJpwucoQFCHOnrub+NzkVCa0wiaU72X3Lfc6YknunOHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZRzOSfH/+6rM1u1yynQ2NxmI2PFykVN/hJKIZXJXgKcg4ZLCM
	CGkuLd4aWyzPvUZ1CJiPIxn766EBypSbRLBTYdfagly4U+6em47HHpFCdEVjFapseFkURiUHhSt
	dXHnZMbtih+UTF272xY0JFxDKCS3Ujz0=
X-Gm-Gg: ASbGncuD7PTEwITc46/q/lL81cVhEb4aQ4muK2Cdx4znVpz6uzhXeXmmkPx16NacOp3
	cF0R44lZp94ZCd15E35ws7b1gpEiWIzZlMHYrtR/tDXhkny/m5uXjuDCFYXlzGtINtuMzz1dpuc
	6cwEm4IRwEVgONP+IP0AkEJTAGZd83uont5BTJP5qpguHVgXtzOo9pyYZc84+x6Ssq2frsxzTkv
	ST9fTfGaqQwdNh9zLUyIEIG0kbMgeoeakzq7MOCMA==
X-Google-Smtp-Source: AGHT+IEy/uz82P6qIrFjsmpII3X2RPVqg5+HVwB8Eq7uM3pSbf86P5Uq0LA2nF+DZAWDaPoEcVvWUmV3gthMN2OLRw8=
X-Received: by 2002:a05:6000:290e:b0:3bd:13d6:6c21 with SMTP id
 ffacd0b85a97d-3ec9a7f9713mr2099450f8f.0.1758025859149; Tue, 16 Sep 2025
 05:30:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902184128.4100275-1-mavchatz@protonmail.com>
 <f92cda21-12d2-4e4d-ae84-666c6f8dce77@protonmail.com> <CALTg27=vaZK6ksriDDoN71pqr0VEbvxAz7Dp1w1toG+tO71Ldg@mail.gmail.com>
 <12899c24-a16f-4d64-bc40-a06b4c5c3e6f@protonmail.com> <CALTg27=uP+jCU7oog41GiZrw7LX_mSfrQtKbDW+xpAHzN7_6cQ@mail.gmail.com>
 <93bf9cfc-29ca-40e4-baef-47c5bd0e9cee@protonmail.com> <CALTg27mj+XcOmnMcH8vo5Bos+HxoWes-XW1eqfKDjnj5uqCc5w@mail.gmail.com>
 <cc2e6e2d-1b42-444a-9f8e-153fa898be44@protonmail.com> <CALTg27mH1rzyaNXEq7SowZcVYMiWUgejQCFgdDCHACUm9j+3SQ@mail.gmail.com>
 <7a4c4678-bb75-4aa7-8f4f-706deba7e72b@protonmail.com>
In-Reply-To: <7a4c4678-bb75-4aa7-8f4f-706deba7e72b@protonmail.com>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Tue, 16 Sep 2025 13:30:46 +0100
X-Gm-Features: AS18NWAfsj40_HwIKhP5SatmQheR4yU63tIXESzU7aebx_grHG7U6qtjzLeXh0s
Message-ID: <CALTg27kat6CReAvU8nXsVzqKEtzytT+_wf9dZ07OFSke=ipYLQ@mail.gmail.com>
Subject: Re: [PATCH v4] HID: logitech-dj: Add support for a new lightspeed
 receiver iteration
To: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, hadess@hadess.net, 
	lains@riseup.net, benjamin.tissoires@redhat.com
Content-Type: text/plain; charset="UTF-8"

> Can you also try the following on top of v4?

Working just as well as the previous patch, compiled on top of the
latest hid.git

> Please test this one thoroughly (modifiers, lock keys, ISO backslash/
> Intl keys) as I've modified the keyboard report descriptor.

Tested every key and alternate key shown, modifier keys, function keys,
media keys, lock keys. All working, including the battery reporting.
I don't really know what you mean by ISO backslash or international keys,
but the backslash on my UK layout works just fine.

> If this works as well, I will submit a v5, and you can send a Tested-by
> on that one.

Sure

I'm heading back to uni in a few days, so I might not be able to test
revisions as quickly, but I'm still happy to test anything that's required.

Thanks,
Stuart

