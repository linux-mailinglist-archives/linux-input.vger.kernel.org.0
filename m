Return-Path: <linux-input+bounces-593-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AD0808824
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 13:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C970BB219D3
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 12:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF853A8C1;
	Thu,  7 Dec 2023 12:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gS0F9CoG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64583D57
	for <linux-input@vger.kernel.org>; Thu,  7 Dec 2023 04:44:23 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40c0a0d068bso9263725e9.3
        for <linux-input@vger.kernel.org>; Thu, 07 Dec 2023 04:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701953062; x=1702557862; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OsE8VKSbmAi+XCUf7rJv0gnWrUVEmUsv4rH9rY5pctA=;
        b=gS0F9CoGehLZx+t8NgrD6u2bop+kxz3vrXxyOlnwSK44XvjRQmb5X5Igvq+RkGf7ld
         zotNuFan722MfrKK0gDuE2pd9/0MwTq+BYaX77TY3YV98G3179EJ5/yW0ha5nzFMcdqm
         RYjNhXgaCodiOb/tyEuHD4E5eJxvaPcc6KgKgYyyHgg1F/DPuIL2qUJZ/m6KbX8Lo1/o
         IXfTFAEYr4NYflJ6ByJtD2+c5PnrEKMdmfTHCmVynAoL7pMZRT0mOqCXqq0FiJkDiq7e
         AYYYOf2gKTtPSxf8SZZnUsCuW9ozCRJTtrvmWd3r2x10UtLHEYiZ9Ssmycc/KC8uJJQx
         wlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701953062; x=1702557862;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsE8VKSbmAi+XCUf7rJv0gnWrUVEmUsv4rH9rY5pctA=;
        b=X7hCejoHhEnPzdLgk193RJp0vw9VHcQtFhU0r4SgK/0Pvzk4dwA634s024iQQw1VZ2
         ySd8a3RSggMF02yLDC3gji9ujlKQv8nNyJfzIOmOtN03piK0A67SycUCevoe0Z1thXbP
         YwDn+nF8t52xj260rymyzuZUokyL1ZVaEQaW9LwJTRQTU6dY6w9myodiqjrdwpQEOiQr
         Kuy2vQSff7TiHNUMODvgHlQ8r9dXLKWADp2ZarvmUKDvPDNtu4UAzAo9yUS/AMBRai+A
         QvodOiCwpIbltvwdima8qk9bnb4TOCf0+sYsBvdb6leHa4YIQdJF/aiYpI26bqkG4TYk
         9gmg==
X-Gm-Message-State: AOJu0YwiwLt8od0bYw/t0W09P8EGZBB09pDaOHxlEI06SsvQEcXGs3mQ
	Hglcnit8dXbAakPfJE/O6wFbjA==
X-Google-Smtp-Source: AGHT+IH0bdOVfz7f3tCZzVLnygI36YPXIwbVzYnykMM8nZfSU0jI0uQOTzmslWb2tU3WnJlf3MiVMQ==
X-Received: by 2002:a05:600c:4512:b0:40b:5e1b:54a3 with SMTP id t18-20020a05600c451200b0040b5e1b54a3mr1575292wmo.47.1701953061849;
        Thu, 07 Dec 2023 04:44:21 -0800 (PST)
Received: from localhost ([193.86.92.180])
        by smtp.gmail.com with ESMTPSA id w2-20020adfec42000000b0033342f72bf8sm1372820wrn.9.2023.12.07.04.44.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Dec 2023 04:44:21 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Thu, 7 Dec 2023 13:44:22 +0100 (CET)
To: Benjamin Tissoires <bentiss@kernel.org>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Shuah Khan <shuah@kernel.org>, Peter Hutterer <peter.hutterer@who-t.net>, 
    linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/hid: fix failing tablet button tests
In-Reply-To: <20231207-b4-wip-selftests-v1-1-c4e13fe04a70@kernel.org>
Message-ID: <nycvar.YFH.7.76.2312071344050.29220@cbobk.fhfr.pm>
References: <20231207-b4-wip-selftests-v1-1-c4e13fe04a70@kernel.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Dec 2023, Benjamin Tissoires wrote:

> An overlook from commit 74452d6329be ("selftests/hid: tablets: add
> variants of states with buttons"), where I don't use the Enum...
> 
> Fixes: 74452d6329be ("selftests/hid: tablets: add variants of states with buttons")
> Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>

Acked-by: Jiri Kosina <jkosina@suse.com>

-- 
Jiri Kosina
SUSE Labs


