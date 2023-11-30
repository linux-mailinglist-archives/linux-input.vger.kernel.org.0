Return-Path: <linux-input+bounces-359-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE0C7FFE22
	for <lists+linux-input@lfdr.de>; Thu, 30 Nov 2023 22:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 177281C20D48
	for <lists+linux-input@lfdr.de>; Thu, 30 Nov 2023 21:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A3F5EE6C;
	Thu, 30 Nov 2023 21:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="djT7O9N6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B45170D
	for <linux-input@vger.kernel.org>; Thu, 30 Nov 2023 13:59:32 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cfd78f8a12so14016255ad.2
        for <linux-input@vger.kernel.org>; Thu, 30 Nov 2023 13:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701381572; x=1701986372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2djO/hdtCxAj05SEfvtxt5bZ+8AqtE0qahmFssCkkc=;
        b=djT7O9N6REoqSZVNeKNk7HsbcgKR1m7xBCj0NavMtLIS9E00YVcNGXA6O2IiRRKaiN
         xpa/umUXDGc/H0mhg99SuIRh8BpFdQNVt3wRyKK51FJu7SrRuPWAmP/HUHdJIFHXCsJO
         YbbJhA+Z4FtvVPYXykHP7DGn2TNKq5nQL+m1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701381572; x=1701986372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2djO/hdtCxAj05SEfvtxt5bZ+8AqtE0qahmFssCkkc=;
        b=Pr3uPWcqzpBhbsrerSnqUDcxPM6E6N2USLPaTnd06KUqgEA2/F1HJckFtoz/ahsvr+
         kHsgOzojZjFyICWUbs/MwBju7AYrRIFNoqmDDoAp/ZRj/epSmEa52t5dOyilSsifvEeL
         ExN3hlolDLPKT7DsIrAdEK7/x+LCBrbU1aGcuWup3Pf84LBvXVw2TQJKDvp8b4v6Em89
         YHpqP/F9aErXf2+xcC+y4Qx98JBtf4nUPB5w9dArXsKj4PUTgrOLWQT/ujiQkDRiiaOA
         AnzLQWNANLg54cnf/sj0QDB8tQhyH2j3LnMawCgtaVvNU4gQrMzGAcKGdCHejS//Qz2p
         A5xw==
X-Gm-Message-State: AOJu0YxgGqBdjlW9Qc9P5DWhXi8A6J9/dY9gPdQ8mCBLbYAAj7wWLCwX
	ec7RHoN9K3NzxnPpiXbhDJyZlg==
X-Google-Smtp-Source: AGHT+IHXL7uU6vw5k8AVrhFvY+svGvoQDBSX/vpE7HPes6CB4/gBu3LXDtFLard2ILDOkQ1JOieQdQ==
X-Received: by 2002:a17:902:ab86:b0:1cf:bdc4:bb43 with SMTP id f6-20020a170902ab8600b001cfbdc4bb43mr16177885plr.54.1701381572319;
        Thu, 30 Nov 2023 13:59:32 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y21-20020a170902ed5500b001d04c097d32sm329328plb.270.2023.11.30.13.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 13:59:31 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: David Rheinsberg <david@readahead.eu>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Kees Cook <keescook@chromium.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] HID: uhid: replace deprecated strncpy with strscpy
Date: Thu, 30 Nov 2023 13:59:24 -0800
Message-Id: <170138156214.3648538.12067944211375143947.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003-strncpy-drivers-hid-uhid-c-v2-1-6a501402581e@google.com>
References: <20231003-strncpy-drivers-hid-uhid-c-v2-1-6a501402581e@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 03 Oct 2023 21:01:58 +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.
> 
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on the destination buffer without
> unnecessarily NUL-padding.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] HID: uhid: replace deprecated strncpy with strscpy
      https://git.kernel.org/kees/c/d4011f6817ae

Take care,

-- 
Kees Cook


