Return-Path: <linux-input+bounces-10055-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3D3A35F58
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 14:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 130D33A6F8F
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 13:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BC3264A88;
	Fri, 14 Feb 2025 13:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gB/fRXJE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0B12139A8;
	Fri, 14 Feb 2025 13:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739539954; cv=none; b=az2eELY4hxJHYJW+Ri4/3vZWSSnSynx2TlLzWkNwgFvOFdd4WFngkvrOOu0MXVDqUunBNi8+PvN7zdR24dInnY4w5NIFshpqtzn+WMYQE9NTOFElPxo+s7hZlv5S4v/BsYHs26NfqYMxP3hqklZDy0nMZ9TSkYHXSKB+0QVWQH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739539954; c=relaxed/simple;
	bh=V5/OO3BqjGF7YYqHo1ixFHMsG/BHYH5z79AbUXkeGc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FwPM9hwE6jblA4/CXu3rRQnJsdAUytx05izcigGzdc7MHqVB3K/AUNtTVGJrR08eymdZ///DdzCOmuthKE1g+PbGKbCKoUOQHVd7MwVN0ud+5QG9o4j2mOdlcsprYw9/oR98Gy+bYOqdPKP7n+fUl1sGTIRDsW9o8HlDuoBeG1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gB/fRXJE; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso2006449f8f.0;
        Fri, 14 Feb 2025 05:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739539951; x=1740144751; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V5/OO3BqjGF7YYqHo1ixFHMsG/BHYH5z79AbUXkeGc0=;
        b=gB/fRXJEjGgdMuchrApMi/MeQfqebYJKRjAfjqXaJ56gyE1UXgYbiKTFthgtVczKpO
         iGBJ3lHE0WmweSIIql3smcs5I1SYjNLHZhtAVn+NUyx0txKxg7ixhpZejGZgaIuGlJfj
         GXN9nfectMh9ZlmSGRZUgVcIBD9P4c5PXsclGLM2LLPaMe1KkVl1f0UTAM/fOXZ3Ejiy
         dibr4yzCwcSR2PrpPsYQ8F2r4SM381ZBTrPPq7aXg+jLAOcteDGSJpYks8SRzSm2S9Lc
         cvIe4ierAVA/hzf+9xkT8ITaK28ypyNAhQ7t/2jBXXQVeSrUupUcexarI8D0+MZ+G6jj
         IhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739539951; x=1740144751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5/OO3BqjGF7YYqHo1ixFHMsG/BHYH5z79AbUXkeGc0=;
        b=YmQ6dICxbabIvHKh7gQFI26+c6NAYNSZrzCtcz3eAnAQviuudPtjFFGALsgS1NyD1V
         HpDVBzN0xXHvAdnH0eAXSN7FExTeZhn8KAFSsc3BZwjPm6qcn5iDzFcKMVI56zG/heVN
         jYhcbECwFC10baKbsp8prTwrSfR2qfrLY5qgjmRyzI4eQ6SzUZEFA2aDIfJzs0zvb8Yx
         K2U1L/Dcqex/3HEIA42/rjlWGvTaHYtUvhxm2twa+kDvkPnJxXEf6/YRtSyWNqpKA0T8
         bS010jctcw4Nngt3o0CxArR3evPKT4cKdS7gN44HX81HnEnrZjSBf0sTLCv0xchNlIrO
         mLKg==
X-Forwarded-Encrypted: i=1; AJvYcCUYdup2OAV4OQXxHeX8NWQum7Pnl7D5xaUpFMrv1IJdTMrBsmOdlVV3DqBn89QZ/RhanjMRVPDS@vger.kernel.org, AJvYcCXPiTio5F4Tnn0CCuihHFLlIZwlSLXZwpmn+xQgN1cBZMuL/GX0dCX3AnacHz3yiCPAQLnwpSuqIHd4qH0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc0Y9Xu/WjpxRSDB5GnAeLemczp+PY155FXpxLDuHaNbZe0hVw
	D8jKErEtqv6ULzCH5xokuBpcZXGamaFhfkGqGkgVr2ldTwQmqpHFClHdBtUR48kQfeRJcV+Exuw
	Z+NSlrVPZMoGCsN5zgQNCUusmqcBZ5cCCXAw=
X-Gm-Gg: ASbGncuETM2DvUxfh4CPn52JWPblx2loNhVtEHhDd+dUoETe8i0+y8GkPaiXHKlgOFm
	QPga4YSD/YQi54PsQhbrmQx7ZdXQFokGC8FpmWpTTNLZzbxnqVF2UT0wtRrpff4G6nCmVcOvwzw
	==
X-Google-Smtp-Source: AGHT+IG9WP8+ZNo83h0WeFmRnnKi+HLuePMl2SVa9DOJjwkyOlXU88efT5p0gmxEYkDj3zX7PEnLqKgxLdJGs3e3KFQ=
X-Received: by 2002:a05:6000:4024:b0:38d:afc8:954e with SMTP id
 ffacd0b85a97d-38f24cfa3dbmr9449189f8f.11.1739539950482; Fri, 14 Feb 2025
 05:32:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213133854.100866-3-stuart.a.hayhurst@gmail.com> <eae04827-0d87-48f5-929a-9f1f23359f24@kernel.org>
In-Reply-To: <eae04827-0d87-48f5-929a-9f1f23359f24@kernel.org>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Fri, 14 Feb 2025 13:32:19 +0000
X-Gm-Features: AWEUYZleqHgvL8C3DS0N7zLUwLcLSDIaKydireboWkZiXcihIMcSrRiQcTlFnXk
Message-ID: <CALTg27kDRv+_y9qS3eCZUaQ6f5A-P8Y2GFyL-EMHZxixW=jYaw@mail.gmail.com>
Subject: Re: [PATCH v3] HID: corsair-void: Update power supply values with a
 unified work handler
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Now I think, what is actually expected to happen if both add_battery and
> remove_battery is set? Do nothing as the code does?

It means that either the headset connected and then disconnected again, or
it disconnected and reconnected again. Either way, the battery should be left
in its current state.

Of course it could connect, disconnect and connect again to end up in
that state,
but if the driver is 3 events (a physical action) behind, we're already done for

Stuart

