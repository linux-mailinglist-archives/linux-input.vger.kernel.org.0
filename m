Return-Path: <linux-input+bounces-5274-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D9B944FC5
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2024 17:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FA0EB21732
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2024 15:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5391B32A6;
	Thu,  1 Aug 2024 15:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8tcIJ3o"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835BB19478;
	Thu,  1 Aug 2024 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722527940; cv=none; b=BYfvcATXJHjXCkHONEQpQaCGFyuIjod90IaRgFfgVo6mGWs6gEeOiEfgldJneF/AswJVxQGUrvBlBPRXpnxjkc8NdY/8EecHASPPGbQQUewF2tJoxxEfcdYd/CFPgggepLfRI4sJE9bba/88ryzzxzss+77upR3KVv/Hu+II6yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722527940; c=relaxed/simple;
	bh=BikVwjCf571JwAVhCB7VXgHjN991LU4AuedaAx7NtN8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EVFArjxmjmeV8SfzS+F6uVoj0fvWTFJpIzYqEXwWqw0THgzCvZXBF/WQGIc959IN1F17fcVxSFyZpuNGQMJFfiuOt3sqooKEGtNh7aRtS7SMsh/C4cetxSTZa6gfcGz71zkQcXEvVWq2yIlV/766FhQcO+MItJId8TH0w1CFkj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8tcIJ3o; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ff4568676eso18100875ad.0;
        Thu, 01 Aug 2024 08:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722527939; x=1723132739; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=875mrkzk5hcuDMLiv4/fjasfAzWb03K0ZN4d5qwYQdI=;
        b=J8tcIJ3o+Vr3fIi8CgQnAxCVHr81rqbkzwYsAmJeIk5h/kM3cHOeQirihG3MIi5o1G
         JNn1io0o2reC5FoNdFFpA6aKawQlW68MzuCsjarF3nfFmPiebRbzO+lPxK1av9Oq22wF
         J0tGCFThj6tmg8NqYRBpTCqnXBvqGSUVgvzi/BVM+omhM9if1EPI9sm7huYu6P1iqyyH
         AQ2KZfFArXIzYK176Wm4VifBpIiDPi2aX8u0MTFrkoqNzOWmDHRxiX/Y1OHLXhpC7Try
         OtzWUSVXyj5iiQLXeLXYtU10Dus7MKhWgYip8FXSSMP+gZNSA0iNUGMQLc2+Odqb+ASc
         LQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722527939; x=1723132739;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=875mrkzk5hcuDMLiv4/fjasfAzWb03K0ZN4d5qwYQdI=;
        b=iOAhOgQtlMUN2jk/RCZq/Dm7R4B/DmJWD5APZwU6MEb6VaWfm9nTFoz95To/vr2qkF
         8fLpny/IsJkb9nqk9suiw4lwp88pYnKoX6wMK9js5INgGcvT9UR0GFVOEiQsss+oXPsb
         U5tXGAqNjcKwPCS9at4tSnqdPAkeU1IJmsaimW30Y4WCY9tKMrGad61EH8EYk7K/KkCQ
         LYo3woT0Xa9u8D6cQxRJcLxpUNXgcRuSAy2dQKuiQkmgwpCUotEOgPry5aPp71fuWdhj
         6c9gF933Sh9s+Xy/h+m6Vi+dPfk0gVTs0Mni2gkXBWXXzwD9H1ehtVIBQWe0S856SLPf
         yAjw==
X-Forwarded-Encrypted: i=1; AJvYcCXOJv1opI0D+nqtazFKfOwDuVjbeuLm0aEbYqLRWdetBKEZGsxsuQGRI00D5NdSTYySW9yF9PdX4sNjaT6HeGhN9QEPfFRT0Tw7E3/fb5cpB5DfTF3sJUO/5WtloYjse4QWozFpnsB98+8=
X-Gm-Message-State: AOJu0YwPChMeuYqIL5YB2S2bceoRtzgc9OPaGqQaawtjAAxrK0B6XDVj
	qTlpS9Q6/AZrGyUBpOiKqg38L+XfZUv5VqBm/MiaAugbv5+jPNw6
X-Google-Smtp-Source: AGHT+IE+0nEvQn+lurc3/uf1SCXoKU3OGwAzMWO5dpULZYhX0mBSzhpraTdjjpYpdQp/cTe+Q5lfiQ==
X-Received: by 2002:a17:902:f54d:b0:1fd:9a23:90c5 with SMTP id d9443c01a7336-1ff573e7571mr6650585ad.49.1722527938454;
        Thu, 01 Aug 2024 08:58:58 -0700 (PDT)
Received: from [192.168.7.110] ([190.196.134.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5929ac42sm175625ad.267.2024.08.01.08.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:58:57 -0700 (PDT)
From: Camila Alvarez Inostroza <cam.alvarez.i@gmail.com>
X-Google-Original-From: Camila Alvarez Inostroza <calvarez@macbook-pro-de-camila.local>
Date: Thu, 1 Aug 2024 11:58:54 -0400 (-04)
To: Jiri Kosina <jikos@kernel.org>
cc: Camila Alvarez <cam.alvarez.i@gmail.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 
    syzbot+24c0361074799d02c452@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: fix slab-out-of-bounds Read in
 cougar_report_fixup
In-Reply-To: <nycvar.YFH.7.76.2408011304470.12664@cbobk.fhfr.pm>
Message-ID: <6871f7a7-272c-6233-8704-23256239ad9f@macbook-pro-de-camila.local>
References: <20240730234242.256598-1-cam.alvarez.i@gmail.com> <nycvar.YFH.7.76.2408011304470.12664@cbobk.fhfr.pm>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed



On Thu, 1 Aug 2024, Jiri Kosina wrote:

> On Tue, 30 Jul 2024, Camila Alvarez wrote:
>
>> report_fixup for the Cougar 500k Gaming Keyboard was not verifying
>> that the report descriptor size was correct before accessing it
>>
>> Reported-by: syzbot+24c0361074799d02c452@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=24c0361074799d02c452
>> Signed-off-by: Camila Alvarez <cam.alvarez.i@gmail.com>
>
> Applied, thanks.
>
Thank you!
> -- 
> Jiri Kosina
> SUSE Labs
>
>

