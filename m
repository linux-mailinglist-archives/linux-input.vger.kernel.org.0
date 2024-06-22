Return-Path: <linux-input+bounces-4557-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC848913274
	for <lists+linux-input@lfdr.de>; Sat, 22 Jun 2024 09:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EB892848EB
	for <lists+linux-input@lfdr.de>; Sat, 22 Jun 2024 07:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0A214AD2E;
	Sat, 22 Jun 2024 07:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuRFlc7N"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C3563B9
	for <linux-input@vger.kernel.org>; Sat, 22 Jun 2024 07:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719039957; cv=none; b=L2gmCtUzI2ze5BFet2pc9pfokJj67EEJzYFchf/MesFHps8bN9Fv0F2ugGuL6D/L3nPrJjfUL2jIMiKzsf22mNcfI0nLAiuWjIeZktSll+4xcMVQbePmK9+5Sw4wkmR17pQYJk5x5nrHjBoE+wSF4c4D7H0VVEAPwXbzIpAnQzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719039957; c=relaxed/simple;
	bh=KcTn4Ua118sH6vFL7RJPIy1jzfQG9hSqwaC0Sn9mBQs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=LE6Du9S7j5x88fd83fmUsJBjQaRDemqD/fkYb8iAxJesx6JfpIe0Q5+DOpodACmG6yjx5ZGXQChoy1F9xovSLvDr5HHUvcAAZqA91KGQS7sqEIKVxQwyOuZfxJXnaNmIj8aOMEyBtNHgtJtAwcdvqLqy/NjSG4Bdll2sxF3de4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuRFlc7N; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e0272692096so2510556276.1
        for <linux-input@vger.kernel.org>; Sat, 22 Jun 2024 00:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719039955; x=1719644755; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KcTn4Ua118sH6vFL7RJPIy1jzfQG9hSqwaC0Sn9mBQs=;
        b=kuRFlc7NKnQzGjMDVf79E+1QJQ5b4VxL0Ip8lXYYR3hzcPEvfCSrGOcOJNsMciL/0+
         HCQiOm7FKCkQsD5EHDh74qdytqp1meuYdrKofx9JDPrDhwwxYMX56zA66bTLZArJ1+sU
         fyTRpPyJVgCEe/3M/IFDDWm37lm6m1W9J/ui30nw7bC9pYzey2mcKmdGZeYZ26Rzmrrn
         DANNF+UFPo6Rc3Yc5oefHkYmB4wqSXOEoLCLdQKdg+5rexdFQKaCay+b5oE/YT5np5Tk
         qIKZF9sglfzEiJEflMvP3fPxDpi/GYIm+Ja8NBu6PnJ+WnE2H/9yapSCbW5Hga5QkqZ6
         EH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719039955; x=1719644755;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KcTn4Ua118sH6vFL7RJPIy1jzfQG9hSqwaC0Sn9mBQs=;
        b=DFKAtUqF9FLhRw9C4Qyh1R1x4D3cxD1hvRrZ2OXpRTV6jwJog+6j+c2fWrVfLHXgeS
         NFARG0xqo3vtWSf1izpJA+k9SM/ZCjUhyvuIJVMNz3z8j5bre/BTqOWDCIinvQI1ilGN
         1h61WbglVTEbea43zpZCiNMKzwR4oKqdx1+gJmsqm0gETwlByia3Jak6tNdYeYbSQdtR
         z0xyWqIX33jJCnzuCREO8R+thhcpUREjFwCmjoZJgoVcrjruXGfFCyoclxRZaQnhucr4
         nQI5B+FgYm2bAO6xmpx3N/4/UM8mxFn/5hQmsw1ived/CsoN6OjaJaY3WLOHpREozm5q
         MWAQ==
X-Gm-Message-State: AOJu0YxiAsYlS0WhQD7hQpG3Dh7ZxQmP9+O1HuE3WjDSrhGxswfY/ixU
	KA9UaSDIoKihgn6QVMzPh7ZjzyfBaylKx0fINURGOYH3zCCX1jB5JM6P468ZtRiDbVzVsRpiGg7
	X+iv0eWE7uUyKGsVP6ZIpWxSfqGg7fA==
X-Google-Smtp-Source: AGHT+IHSQUyTeMJexQHNyxMAFVyCeYxevNl+lHeNcMxu3MWIHmcnVI//YtHbc9o2wa4q+dcXdQyL0/k9aFCdUCRmHfk=
X-Received: by 2002:a5b:609:0:b0:de6:141c:3430 with SMTP id
 3f1490d57ef6-e02be1376c5mr10606095276.17.1719039954690; Sat, 22 Jun 2024
 00:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Michael Zimmermann <sigmaepsilon92@gmail.com>
Date: Sat, 22 Jun 2024 09:05:43 +0200
Message-ID: <CAN9vWDKhn-OGVQWr2v+syN4f8w_3VtK4zBFwdCvT3O+6txCdRQ@mail.gmail.com>
Subject: Sticky fingers with GXTP7386:00 27C6:0111
To: linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi

I have a StarLite Mk V with said touchscreen and I seem to have sticky
finger issues. Within a desktop environment I noticed this by gestures
suddenly behaving weird or stopping to work altogether. So I wrote a
simple C-program which uses libevdev to track slots and that shows
which slots are currently reported active and which positions they
have. And it looks like some slots will simply not see release
events(ABS_MT_TRACKING_ID with value=-1).

I didn't yet find a simple and consistent way to reproduce this, I'm
basically just using 10 fingers to randomly cause many events per
second until I see that some points got stuck. It's usually many(like
3-4) and not just one. The weird part is that it seems to be using
"MT_CLS_WIN_8" which has "MT_QUIRK_STICKY_FINGERS" enabled which
sounds like it's supposed to solve this exact problem.

I'm currently on "Linux archlinux 6.9.5-zen1-1-zen #1 ZEN SMP
PREEMPT_DYNAMIC Sun, 16 Jun 2024 19:06:18 +0000 x86_64 GNU/Linux".

Thanks
Michael

