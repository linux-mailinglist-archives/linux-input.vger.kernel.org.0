Return-Path: <linux-input+bounces-13696-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4FEB12E93
	for <lists+linux-input@lfdr.de>; Sun, 27 Jul 2025 10:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B24703BF1E7
	for <lists+linux-input@lfdr.de>; Sun, 27 Jul 2025 08:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693131DE3DC;
	Sun, 27 Jul 2025 08:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPzlfVkP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73EB19C560;
	Sun, 27 Jul 2025 08:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753604900; cv=none; b=K9jaK07I4SCOr6s7W9YpWEHmu0EQEmxDt2Pzmnz5Bo1fwnoSvH5qnRUN7ZBeUUX6NAhlzL7RmmJsiq92w7zWn0j4Y6z2UbjNMEi43i3PCT9csV5gjrki+KWp9HrAldnyd/QuC8HSAqYE5+NbjxaHzGYj3IRuViBH37MoTeut+TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753604900; c=relaxed/simple;
	bh=8KSd7Cb22dZOY1l3K37eOD3T0hQuHAeCZWFUuL3w5h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8+UFbHEXiBvKRmyfXTUR9WQfsrW6g9B7F8VBLKkMk5RhOgys8ukE5dhUBbvnNjEDs2Czr9KbCsCmN+KsqMyeom3Eqkl1jvHEogbmISOFYR2el29AEMw8syIwAMF/EMDuS6jvugGfTpJwCYXWTrZtIJZNvJufIjANxhdbLmwGnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPzlfVkP; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-234f17910d8so29720445ad.3;
        Sun, 27 Jul 2025 01:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753604895; x=1754209695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7HEd+hzK/ycf/UDVJ0m22j2xv6qIbbUz60RE46wnkG8=;
        b=mPzlfVkPm99CQ45omJi0NPuaCcB0OIxLw/cXga3i2qkO57TkY8uFJtRr1a53tQf41C
         bhlu9BH8FlhEC0vp0FhiwW+GK+onz5cnY1a11fhImr1SxejDeNVLzLt5/nhTp+IQjmrN
         wyd5dTooenbUg66p8570A9EF+JcX/IW+B0qh6rr2JYc0Tu88PIp3per9rjdzbElcAMSW
         ZS1pEUe+TY1M8QLxS6QgWA89auoyj4bmm4KKrIY4wUA5yuVb/JEkrdszuUn+/1ZGPHtp
         UxkiAJNs2sV/8O0s4p2Ngz3Jm6xLa93CXvs1BpKxdmM+R3YCmYQgwHfI7CM8a+W6ymhf
         u8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753604895; x=1754209695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HEd+hzK/ycf/UDVJ0m22j2xv6qIbbUz60RE46wnkG8=;
        b=nF/4K6qxYnK8s8/yh/uFMJd0CcohfFKAML0AnUiObvyRnsuIenseukf/QCXaXd06iQ
         k9+ICWz7sqfV7RV9J2x2fbBtbi7lEsMzlVrHP4N4K+5Q0qV9PdJ4PaVIUhTX48Bk0T4o
         ooc01MMS4b8Tf3yDhFbM7kf03hFflJYYhW3S7xf/ts4bpIYod4zWxryWu5o3JMJN7l+z
         HQaS0+1rq7ZALlvgjoVUFj6RzpEpMkujW7NCcrrzTHh8CNp97gOOZuEYcK+jtUiTIY3M
         tbAwtY322EbzCfWSIgCrRWkrtCtrEm/bJxlDUU/ETHIL7j1Z+VQP+Za1ovZHGyWaxq3P
         EgRg==
X-Forwarded-Encrypted: i=1; AJvYcCU+eIqYs1HSp3FCixXhYKbKpDafZCh49EXxXRN684qz/0Et6zu5wUbxh+ESxBBuneXW+TBX3cqHERWt0Q==@vger.kernel.org, AJvYcCXVotNqbyoaOOJIV7gkJWX99Y6CM6AG2F+5SHcPnPFnPQq6pG0ysK35j5krPA5o5ufFlQ2NIoQhE/0HqRAF@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu3Qcb3dGkDLBwd0n95g4JgozzSA/OvGkkESHd+WlbY04nuyOj
	qdkQ0+a+agVXxuKYhXXWbvaTQ/0CqakYuEv0GYxf+kMl6qgzuwwawhm4
X-Gm-Gg: ASbGnctynhbz0/7DIu0jKxOcaXYgbbSqgioVnBwpkwybvcai+ijTcRSaud+uRUkzAlM
	9R6+hoVY/fl+Zx3pNF7ZVkybRIm8j1C47WmodwBkRRja7AKb1xy4OFcjCxqEMgPHukuOTc5i+YE
	FUfZ2B7cU5vyUI5Dj3cripmXyxYoSEK46IOCSLjUm35nMQZNq1h4ICcQodAE1sMOK2Vfxatxzi7
	r6u5Jc4pNgQUhc5irIpRvA2s9Bh24sPRd2+bl71ylY1keJTpQEyz+d9msPOFfoPDdIWOqUAZbcT
	ViJwvI+OAsczrv240aIhm0sJuz+3uq2ZRjC7bkmOAYWj+l1xmp4hSxfAJvVInlSnhVfioz3bA13
	+dY3+XSPK/4zNNepvlemjIuY=
X-Google-Smtp-Source: AGHT+IFB6Ei4EV8knVL+P/k7fgq2yexLVWYT7O8AEEKa6QjeVWoM2qCeyhKQaqtjwdKwbL+uo+FVlg==
X-Received: by 2002:a17:903:490b:b0:234:d7c5:a0f6 with SMTP id d9443c01a7336-23fb30aaf67mr87546985ad.31.1753604895091;
        Sun, 27 Jul 2025 01:28:15 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:152b:d3db:2a19:4eb0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe4fd06csm30100665ad.85.2025.07.27.01.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 01:28:14 -0700 (PDT)
Date: Sun, 27 Jul 2025 01:28:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: hansg@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Input: atkbd - Correctly map F13 - F24
Message-ID: <wzlhkta4wtbsw3aieaesokg5gchiejrpraelhwlpzercz4q4z2@35a4dhjppno2>
References: <20250722120438.28011-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722120438.28011-1-wse@tuxedocomputers.com>

On Tue, Jul 22, 2025 at 02:04:35PM +0200, Werner Sembach wrote:
> Currently only F23 is correctly mapped for PS/2 keyboards.
> 
> According to this table:
> https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/translate.pdf
> 
> - F24 and Zenkaku/Hankaku share the same scancode, but since in real world
> Zenkaku/Hankaku keys seem to just use the tilde scancode, this patch binds the
> scancode to F24. Note that on userspace side the KEY_ZENKAKUHANKAKU keycode is
> currently not bound in xkeyboard-config, so it is (mostly*) unused anyway.
> 
> * Qt on Wayland and therefore KDE on Wayland can see the keypress anyway for
> some reason and it is actually used in a touchpad toggle shortcut, but this is
> currently being fixed in both KDE and xkeyboard-config to make this less weird,
> so it could directly be fixed to correctly handle the F24 keypress instead.
> 
> - The scancodes for F13-F22 are currently unmapped so there will probably be no
> harm in mapping them. This would also fix the issue that some of these keys
> can't be mapped as the target from userspace using the `setkeycodes` command.
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>

Applied, thank you.

-- 
Dmitry

