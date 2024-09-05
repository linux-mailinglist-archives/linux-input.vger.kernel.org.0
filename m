Return-Path: <linux-input+bounces-6238-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D35996CEFC
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 08:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC230B20C39
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 06:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6468115746E;
	Thu,  5 Sep 2024 06:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S1ccKHL0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A7414A4F5
	for <linux-input@vger.kernel.org>; Thu,  5 Sep 2024 06:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725517061; cv=none; b=mwcdj5ZgXO/7ysS6+LvrQtBvF7Kkl3D/BnSx2xW8ajHo11vbAoP29dcaXGpnHmr4nIJ9nigfjUkxilid/C/XbqMwyNsSF6Oht1Kk0TmzfnnrkX52QkNZ6nqGze1C3eIdm2IR1z9NOhIWc43AINz3dSFPxTL4ctHL/86P+8pc7I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725517061; c=relaxed/simple;
	bh=a9Av9sp6ymM+84N2C4qnrEq28ZGwB3WDKAkvQxqv0aU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pTSFUbZ77obT6aRA2hjRV3MMnQKKj4jJu5gJUSSntnXoavenuz9Aj/cxeYhl7k2MV4cO2aWAtYpG5oaCb3kvW9+icCc69ZvOF0mzkEhKaTaRCregldvHm90/SuOae9YKUDnr/OafAd8mA7yTj+fx4sDFjGpb2AkFQZV6wOg4j58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S1ccKHL0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso3158885e9.1
        for <linux-input@vger.kernel.org>; Wed, 04 Sep 2024 23:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725517058; x=1726121858; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GuHZ9sBRf9fA2hjZbSAYwiWZLmvkoPQ9PJdfuZOUkIw=;
        b=S1ccKHL0cmZawiWUL/HlFIJC7gzQBjjFVMAzxvjOJCqmJfb3nV808rvX1ItStqUBEC
         0po8rSwhy71dIHREgbRsGKlvFjaB7+EqfTBeKy+T8BSy+x5mLzy5Qnkmlp843YU5SLCC
         fUSmW75+8BMMUbcH4LmNe88hqkjyzoNeCbQtUaB5MfgJHEh5FyMeykORVGAfVQ1jQ/R3
         KOZhh5KsOLJ4jR23DqIRhmPCDmrOHjU7p9b2iJV2sEu/F0fctkl2OoqurjqcZJFWjQSH
         rBtXECkH+53j33tJ77r9nALp8znovuQP+XhDA3isQKkOUijt0RpT9mrvmaNiPX7sV51d
         OPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725517058; x=1726121858;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GuHZ9sBRf9fA2hjZbSAYwiWZLmvkoPQ9PJdfuZOUkIw=;
        b=KjUK+rNqq/Nw/rw9uBQJ/TLbHOaqjefhUn8QMtwTj3r7izczHXLKgOFwTRfYHkCAoL
         CIGV44awoXfvphzOyX56ynu39iQ45gaYDN4nTpCjhLtq57UhvrJKQ3gPw90rp3/kjKtY
         9tq0IrgsOUNLYtmeTTvKuHE9IcDVhfDI1Cso9TBhX6s5jG2ncG5HRWCMTqpN7OcGTR2j
         A7FrsbzsI60WNmSWuC5g1qIWnJAbpwH8pupXCaIu2Ut3H83il2VM6jazjPJKw9B/NI+d
         sLTQ8t04D2rCim2Pe5g1Jkgicx5bk2Y6R7i/2BYxMhk/ae48bwBp8jv1Xxz+uCTh/wYU
         eimw==
X-Gm-Message-State: AOJu0YxxbJ4boTYTfwrOpjFR1v1a/AbKzAC32ekkyDkVQbBANStO/h41
	eWh/Fp8uNO1fGftUeOdAM1RO5kWFWoPlkD1kAIxW5Td7bgLbtPsWHiNhx6KoH2Y=
X-Google-Smtp-Source: AGHT+IEvKzgcLzuB8ZEM5VDUxPR7TNQ5OaPZbvo66WC0Pz+DBQwp9wm8as2hIv61rYMvqBO3zIAzaQ==
X-Received: by 2002:a05:600c:4ec9:b0:42b:ac3d:3abc with SMTP id 5b1f17b1804b1-42c9a38b25fmr11109905e9.24.1725517057754;
        Wed, 04 Sep 2024 23:17:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c8a08dafsm11000417f8f.75.2024.09.04.23.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 23:17:37 -0700 (PDT)
Date: Thu, 5 Sep 2024 09:17:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org
Subject: [bug report] selftests/hid: add tests for bpf_hid_hw_request
Message-ID: <a8082ffb-68f7-425b-a3f8-f9f14dbf2a92@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[ Moving these functions around made them show up as new warnings. ]

Hello Benjamin Tissoires,

Commit 4f7153cf461e ("selftests/hid: add tests for
bpf_hid_hw_request") from Nov 3, 2022 (linux-next), leads to the
following Smatch static checker warning:

	tools/testing/selftests/hid/hid_common.h:212 uhid_event()
	warn: assigning (-5) to unsigned variable 'answer.u.get_report_reply.err'

tools/testing/selftests/hid/hid_common.h
    207         case UHID_GET_REPORT:
    208                 UHID_LOG("UHID_GET_REPORT from uhid-dev");
    209 
    210                 answer.type = UHID_GET_REPORT_REPLY;
    211                 answer.u.get_report_reply.id = ev.u.get_report.id;
--> 212                 answer.u.get_report_reply.err = ev.u.get_report.rnum == 1 ? 0 : -EIO;

answer.u.get_report_reply.err is a u16.  I couldn't figure out which kind of
error codes it's supposed to store or how they're used...

    213                 answer.u.get_report_reply.size = sizeof(feature_data);
    214                 memcpy(answer.u.get_report_reply.data, feature_data, sizeof(feature_data));
    215 
    216                 uhid_write(_metadata, fd, &answer);
    217 
    218                 break;
    219         case UHID_SET_REPORT:
    220                 UHID_LOG("UHID_SET_REPORT from uhid-dev");
    221                 break;
    222         default:

regards,
dan carpenter

