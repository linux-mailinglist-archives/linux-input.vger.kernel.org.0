Return-Path: <linux-input+bounces-14577-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C85A3B50BAA
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 04:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D19911C6406C
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 02:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A170D29D275;
	Wed, 10 Sep 2025 02:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0Dn8VaB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CCF29BDB9
	for <linux-input@vger.kernel.org>; Wed, 10 Sep 2025 02:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757472259; cv=none; b=nE/gA252Amot0TXr4EsCmy0INHyWNBkzKCCdlwtEwHpDvW3GspnF0+wEOke+CUVkPgxW8AxV8t7mLfGJ91Qvh0KkTyhzFvTbtoAbjAbUKYzkhotBaGWXHoIkcoCwk5Md7W+mjRxehRvfTrZJn3bNKT0+db2QmAZcw7fn5YO8IHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757472259; c=relaxed/simple;
	bh=6OcQVYeGOU4WgFTRHis1wqwEDWB+0SczE+BppMdgfBY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=KZQD4XVi5e0L+zfn1aBYe1j7Be3zhQT1rj80BEV/lnpBJCMBJ6WjaxoHowF/VCzf7maJb/o16HVRb1PZpBEuCWec4NRKgL7TUnkPjuaD0rLpjl1P3wwgl5lvAeGwcMMQnrhrEyFNePJXi3QBBD5Xe4W6kB4/aYWBh6vIOreOzL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0Dn8VaB; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b07883a5feeso44540666b.1
        for <linux-input@vger.kernel.org>; Tue, 09 Sep 2025 19:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757472255; x=1758077055; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6OcQVYeGOU4WgFTRHis1wqwEDWB+0SczE+BppMdgfBY=;
        b=Z0Dn8VaB04C5exkSI2u2OBcbM37wA282UyO4pzuUeEzoiutfG8yMmIthRg5IpHi+p7
         l/ILwO8+7sn0WE0qamfA3tXkBY8mA4d7kKnKRc+tX5eivsifO7KX6UBrV2fQiXTfUi3E
         LO8Wqn5yyLBl6SkskN2HoW5bOoIhKMaslWUBvgOaj8+uoV73F2WzAMZjMBUQNlc4iWmM
         aZ9bKhdmQX0CI8xCaHRR8M7HiCtuEFRWM2mUm/LqiowV2Q60zXQffpEK3yKN3NL5TB9U
         gmHu3twzcuMbZdE26msJ8/768UyFr/Rdu3NJmfWXGmUQx8UKFXEKXIWjHI9p1Rv8009a
         8pnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757472255; x=1758077055;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6OcQVYeGOU4WgFTRHis1wqwEDWB+0SczE+BppMdgfBY=;
        b=fDP2d0W+msp3Sd0KjL64itnWI4Po86I/oYsxMbDjF8Nk/qBNyoiFUpTk2jz0C5Jioj
         NDfbV11DxkpoOCc0rpqg/4ovh5sLdU2/GeWh6eGDt7x/WCmZbuc2fMuSh0iJ9cDZCD8K
         NPleduoCNU5b3DYhwGeTREk+kYtuGBirfOhMbbv6iMuRBaa8ekRYySEQPTBXJWJah3Fk
         GqyBSUAuIObcsM1Pmd/2QNC/VCMxOiECeyCey04adiAPZ6JKReCXvkpn6RRJVlRtZ7AG
         lB1s9IyR8NcckbdpI2ISsOGA/YT7IeO60ywz6+ZpHrHFvod5ma1GH9xNq+5ok/XCQF6r
         pn8A==
X-Forwarded-Encrypted: i=1; AJvYcCULYheSUT6eIOHkTe1q3bWsHJEhgIXgHFrpAqDMVALcS+6Iq9b+5C96DjJGMeEDc/54QjY7nS+C1In8rA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxseVi2uTKr3Kgsi8J5hsrNRgR/8V/H828hmh5YvdhWF2A3f9lH
	mFzaK/uS2C4uOCb6DYiGhHdXrdgDabKKVjvVMudzD5TyvFor2rD1qXdOIQbUveNSikA7O2MtQOU
	R0TVo9jRAKkQBoawMbHwfqNmHPDEkVRm2my/l
X-Gm-Gg: ASbGncsP4NgGqlWyvVMsNSvmgZfgNraAy1uaCyQt02/IP/tilpG8yYH7ztwx87nOk/0
	cYLXLewTFq2YvLEVIqbj7y3kEOeRyz8RGyQk78UUWs7Esy4rUy5gfv4JN+QF9xcgsQwUGYzaNT3
	0mO/AEKV1UA26M1jLyh7pOo2X/Ox3TL5HmZISRItiarBwR6DIOJ7pT/giM9F41NvSrqhzcjcWbf
	r5ln1lQA5b2CCJh9d6mB+yr5WbTWiKFYdjOTb4D
X-Google-Smtp-Source: AGHT+IF6fAD/rV9wjx9Mj5C2ks8qonhKxbMkOy2fbxMNjmT3YDgwelZhmuL0MOYN70gg2y71L6BGXAJ+7erUrUcEjU0=
X-Received: by 2002:a17:906:fe0c:b0:b04:7708:ee36 with SMTP id
 a640c23a62f3a-b04b13c8c2dmr1344320366b.9.1757472255246; Tue, 09 Sep 2025
 19:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Raf D'Halleweyn" <noduck@gmail.com>
Date: Tue, 9 Sep 2025 22:44:03 -0400
X-Gm-Features: Ac12FXxv2Appcsh3B37TH74ZVi_2Eth1EkUuiyekWRwvJKtAlj5j77hDVy7YLlo
Message-ID: <CAHXQQi+6hS+8knAmQH0Trsbym_t9z-qiJTEEVh6Z8O8pCK7fGA@mail.gmail.com>
Subject: 
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I think there may be a bug in the 6.17 RC versions of hid_multitouch
when used for the touchpad on a Dell XPS 9310. The touchpad will
frequently get stuck in scroll mode. The touchpad works normal on
6.16.

I don't see anything in the kernel logs to suggest any malfunction. I
reviewed the RC changes for hid_multitouch and did not see anything
obvious (maybe the bug is somewhere else?).

Let me know what information I can provide, or test to perform.

Thanks,

Raf

