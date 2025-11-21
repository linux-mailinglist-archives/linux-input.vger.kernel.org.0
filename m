Return-Path: <linux-input+bounces-16280-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E56C7BE95
	for <lists+linux-input@lfdr.de>; Fri, 21 Nov 2025 23:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 848E54E03CC
	for <lists+linux-input@lfdr.de>; Fri, 21 Nov 2025 22:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1794D303C91;
	Fri, 21 Nov 2025 22:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDh6lANZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4C02E5B2D
	for <linux-input@vger.kernel.org>; Fri, 21 Nov 2025 22:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763765931; cv=none; b=CQCNDGGSPg5j4xAwpd8uqJoRdbmA9yfiiFs5dzIwLu8nVxM4nMorIw/wDjHuHxCqrr+zS+HbwrigNwUtpBmFBtbz7QijRkLBogp4kC2wloR+Lr+ec9EbvExR6S5m5/OTXYWE1/78tjbMqyfrYH/KDmPh0pfJMnFwzH7OYPzoRfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763765931; c=relaxed/simple;
	bh=dYml3CxRqhuFafYPuzljVOQUW5PuukO0QXL0EG9V1l4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o54WqNv6Mc4r6TnASfAHRp//MxmK/dPXJfkaJKMGt6KQwv/u5zDBL2RY3yIn9xuUu+WowJq7xyZwnBEmQGBX16RVPEadMVN44gMifcp0bKFjW1wKzFUFiQnrGRZ94HhWELWxPuelM8TAACjNlef1GeKb9+TMq7GCqJYg7RSNJw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDh6lANZ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3436d6bdce8so3045185a91.3
        for <linux-input@vger.kernel.org>; Fri, 21 Nov 2025 14:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763765923; x=1764370723; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dYml3CxRqhuFafYPuzljVOQUW5PuukO0QXL0EG9V1l4=;
        b=bDh6lANZDibFz3cBXD0+PRYi7J1FB/nGulyKaE0QiE0Ap9ZNHbRTmXXtstKOwaww5f
         nD115SxbfBEy1/dFJDkJwBAHiIOqzpuh/nJwpKSoQ6zjXMUNn9RW9h65yFFoMuy3LHxq
         NQsbmrtsHN3DkAlw2KXKtUOxTPqbOknoM0B9cCgCjmnq8zQr/TTzMGFGg0Gjn9b4BnAJ
         0OV8dGDwd3o4OwjyXXcAJvugwohU60jlTbomlqIslH47KsUpvm5mQ7i3aIsIC9l/oIgV
         WAeGuzW0dnANTnQOT4Gr3BqbpcXtALQdwgDo7ALhJN/B/SXkRsvEM4emqwmF9xA+fLZL
         ap7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763765923; x=1764370723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYml3CxRqhuFafYPuzljVOQUW5PuukO0QXL0EG9V1l4=;
        b=usHh5dklusb8pcEsmHxrxp7aPv5jU1qtC85VCe5ZC9GtErJmm1itlSy9hfeXs2kyRP
         1GtJB3rZ+W48Dqn9jrFayHfXILCbjbKbfnOTuw6zHYo5gmrZxycfeEA6Do4vWIRWtkkb
         ndxl736HE1zEH7aKu95Jk6kUy61UkJPbeok9/uNGadzASCX/85r2hdXPCA4zqvuzNrI5
         HxHk/W64LNskmkpKgRfmy1ygm8SVxfxjMn/gJHhmO+4BSxWc2xsNJXqFnJxUAHPRu7ma
         rfjI4DJ4VAJr2Rd8YFhBRXV+pu4KKlp+eQbHVOzNYgKRvxFUYUq5cO7si0v5In7VocYr
         He1A==
X-Forwarded-Encrypted: i=1; AJvYcCWtU+PfpClL02RIEh7o0W7m3hOop+2vb55aLf6gWDfeSeGqKixfp+tThpHDl2OA8oRTQYwIbg9uoWbe3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcfVO4s5uGiVAPC3nCV0bsVt7dqj8GXZrXvCl9xApEnR9jPvi2
	1ivnEBKwybySGQK0R8rNRJeh3drlLQdsCEHFbUACGY94n5HxiztT0LDAh6UnUfuKoUV4VZhiYil
	onuOEwxovAqLHFAFYtkMeAPOM9pfir2tgsOn5++PPBq0f
X-Gm-Gg: ASbGncv+6d+H5i8S0z7cCwcern72aHS+eDaOd6E7Fg43FD5Fnu6BUwCRUIr7XUYarEZ
	1Ufe8TQpbIv1G+MsHrJT7l3cSQ17rQJCc00Obn0zBEnCpLcIVM8GuuOdriZCUeuJYgT2Ie2nUjS
	eKP4zYSxZbCHhFwevv3VSD3zkDAv9V7qybiuFdDJny2rWr99Gw84C3ELOxD2yHkUqgAWXp/hA87
	rCoV2iUGoluKlqQJPkC9oHwUasQ3LeQE7PjTJ7jC4prdaWxaq1E70Ti25Cu2CDAgmUEvKxrsq82
	bog=
X-Google-Smtp-Source: AGHT+IE9px0EEKa51fPZpa3PWVXJejNs+tA17V8kXAjVQXx8k0w31Idz4yZrUg4nQQHGa/NQOgLVUnbAb3R2a8TWD74=
X-Received: by 2002:a17:90b:5703:b0:340:f009:ca89 with SMTP id
 98e67ed59e1d1-34733f21e58mr4430966a91.22.1763765922626; Fri, 21 Nov 2025
 14:58:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b627cfc9-0dda-4b59-ae5f-83f40cf6088b@cosmicgizmosystems.com> <20251120014931.580340-1-linuxhid@cosmicgizmosystems.com>
In-Reply-To: <20251120014931.580340-1-linuxhid@cosmicgizmosystems.com>
From: Artem <temabiill@gmail.com>
Date: Fri, 21 Nov 2025 23:58:31 +0100
X-Gm-Features: AWmQ_bkysm7iqm9fd8VC7ZNWxuz8XhAJg4nbY-3aRyjbUpJB7upUAbDbvCO_IvE
Message-ID: <CADYkRmo8QZQ9EK7WXnvmO9-ue6K=KP+BRA5mzJdGo69tk3cjLg@mail.gmail.com>
Subject: Re: [PATCH v1] HID: Fix Report Descriptor for Evision Wireless
 Receiver 320f:226f
To: Terry Junge <linuxhid@cosmicgizmosystems.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Terry,

I have successfully compiled and tested the patch.

It works perfectly! The side buttons (Forward/Back) are now correctly
detected and functioning immediately after loading the patched module.
I haven't encountered any issues afterwards, other functionality is
unchanged.

dmesg confirms the fix is applied:
[10307.732966] evision 0003:320F:226F.0009: fixing EVision:TeLink
Receiver report descriptor

Thank you very much for your quick help and the fix.

Tested-by: Artem <temabiill@gmail.com>

Best regards,
Btema2

