Return-Path: <linux-input+bounces-8122-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 803DE9CFF9E
	for <lists+linux-input@lfdr.de>; Sat, 16 Nov 2024 16:40:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3811D1F224B5
	for <lists+linux-input@lfdr.de>; Sat, 16 Nov 2024 15:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E8812E5B;
	Sat, 16 Nov 2024 15:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UsHqSiYo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E7115381A
	for <linux-input@vger.kernel.org>; Sat, 16 Nov 2024 15:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731771639; cv=none; b=UvpWu6YQKHvaiB/bUeeLANfXSm3teIrhGbl7bGc4ZeVNMJXjYqukSAnC1Cb/fEgoHtzpxoTv2wyJ86BZ61RUGJ2qgFDi7ZL6JEyCKEGH45+er/4hLOBQG92T3fRG76x8mzPcGUQK7tem7VA4WpU6gs8xOVmmAI1/fkBJqYKiZVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731771639; c=relaxed/simple;
	bh=Wd+7kLQISUZlzyPvYmSUTVOb8NV4Vyd3OpsFXw6X7a0=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=l0fOXgSueFHjOqfpSxVtzpwGmTIvmTwKnJCK1smz2+ahQU5d5+TE8RjVNXcvqtWgR1ZEz7DYBwGwcWVvhrr9sk4N8H7H5+fpS0FP99tqMhXAldvXvNaWyX/oWVzzY98dE6YzwGxkvS3Du3QEn0MiElOfLPFKDO6fY5iBXLicYqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UsHqSiYo; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e49ad46b1so2167373b3a.1
        for <linux-input@vger.kernel.org>; Sat, 16 Nov 2024 07:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731771637; x=1732376437; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=UsHqSiYoHDiv4a3JsIKlFcFS1aZO9RbQexmJcYLRUx/0oPb8/dkwFQEYPvhHF6niSR
         0d6CXBh4SSNIbIHXmSZEM+eVnY5pYFEJSfYXtj3fKEfGbYIocjE6pEEgPn35kxMY1QK+
         XMR+/ErD6o+EY/UX4LP+J75+0khfiLXfkjQ+nQemKka+tl93gtcu5vTM/FSvWjHBE+7m
         NoHDctihG0TQp7kaZjd4Op2JPomlKAc+Odbryf+zmLKylRe3QNpZ0rfnsfOCLi2FBhEe
         IYKTHPyJ4nJ28yXBI+HQ3JR74Ki6xtYYACInJ1MoSuEpGzjyXJrbp+2bJbJ8bxNTXz5i
         JJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731771637; x=1732376437;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=bvKVYqZiCvc/1Y8pgZEgn63Htry+a5jbDplLnTCTUV1irl5PKP0UCM58tTA/Cy3AI9
         GTG3u0odbt4N/cim6UasYMtvvwt0jfci0k67fTgh+yUAFlyQFgsZ+Ylu06/ebN1IWRYk
         ZU1lQaJ60som7zmvxbqDFZKLTtHkFSxeRTJqb68Yrxi7IncoMt7rNMqqTHFF+N1laDtm
         CZ9Ia3BmRD/X4Tb/F6kAne1JDVh9LHTnGvni/6K6T81uH/QulSnAWZBzN5ZzvQ5Y57yq
         8noahmgQ5NDrd13J3WQhXn/k5acx4ud2xvH2drK1gjoG1dTovhxfzjYUT5+2HoHOJf9w
         9Irw==
X-Gm-Message-State: AOJu0Yw5PEjPCn68UhcJIfm95Rw0m2uhlTxY/1Oksrnufa62X8v7o6qE
	TvcOpqjuuTiU/cKktLsnzSYHHxUVssBT0gDYjb0eFbd6Sh2BtuX8rBf6Xg==
X-Google-Smtp-Source: AGHT+IGmOORQ6uIXOyIrV2nb7nWNi6GoMsm9V/AegVC4KUDWHmLqUfNsR3MwyLEM+gSMB2T4TmRpVg==
X-Received: by 2002:a05:6a00:a08:b0:71e:6489:d18 with SMTP id d2e1a72fcca58-72476d5a95fmr9625588b3a.22.1731771637303;
        Sat, 16 Nov 2024 07:40:37 -0800 (PST)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724771e3ee9sm3186064b3a.165.2024.11.16.07.40.36
        for <linux-input@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Nov 2024 07:40:36 -0800 (PST)
From: "Van. HR" <hussainsheikh59235@gmail.com>
X-Google-Original-From: "Van. HR" <infodesk@information.com>
Message-ID: <a56e712e53bbde3a6279c41d19f98dc9ba177904b36fc316b73c32be6a0f89f4@mx.google.com>
Reply-To: dirofdptvancollin@gmail.com
To: linux-input@vger.kernel.org
Subject: Nov:16:24
Date: Sat, 16 Nov 2024 10:40:34 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,
I am a private investment consultant representing the interest of a multinational  conglomerate that wishes to place funds into a trust management portfolio.

Please indicate your interest for additional information.

Regards,

Van Collin.


