Return-Path: <linux-input+bounces-5045-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE23931CC5
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2024 23:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3E95B221B8
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2024 21:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8A713C9A2;
	Mon, 15 Jul 2024 21:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X14lzln5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D7C4C7C;
	Mon, 15 Jul 2024 21:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721080281; cv=none; b=u93og7cabJMb09AobpP1xzmcE1qYWoT/7CLTWi1zLHnF4nby+RbJrXZUzA0ee7Y1ZBe+L0Rll+SRtzrzF0ts1SQG6O+hnwn3IiR6v/jRfo2vEljRrJDZ9vAjSFHCYQmc+RGMKf/6vMAn3A2lVcBUnGD6VcvXBS8NTE8gFL5WMg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721080281; c=relaxed/simple;
	bh=PuGKTD0bqaCNqwyH7ywYKEHXZHJXYd40xsrP5Ml+05Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PKfPSVsLpd+WMCRSMdy8uEV4yiIDcL8ScfiCQEWHgXvsz80Tn6h84rjy/KajRtpyr1JQuzOOKvHa9BHaexcgKMA4L/shTNOs46QNVxsz3GeGOdQ6R6n5wsWbPps9xYmeAKHicUH0r31B4Oei1vLXJCFQUrJjuKMW2yjtupZUCpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X14lzln5; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ca4649ad49so3080164a91.1;
        Mon, 15 Jul 2024 14:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721080279; x=1721685079; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PuGKTD0bqaCNqwyH7ywYKEHXZHJXYd40xsrP5Ml+05Q=;
        b=X14lzln5C/1OzgaacMVwwkXpVcpU9geUjfmI0sesRBi7kiC6hJl9mOBGJQ+JzAqquC
         0IJecGcYW6AeqAviF+qOxjs82+/nKHOqHUmHyk9L3tqcht+ZRDONsft2ZjRlOzQh0nxx
         CYdkoch5GGg0EgkoxnZ3RCBDVk9hWAmOJwnF+hLHva5mGlhEN1+k3r7NxUYrxISSzAzt
         YV2e1hZ5B0zaOA8KgZZoBoG2q9I6Rna3Aq/MQcR3aUN5TWgvZM7c6ZoPpzk21Sbt1aOd
         sKzZ+JE5VQamKAnwKO7yfwCrik/76N81vsnBiWHFM/STD4teqAOHXnrMC2Hs00ltq8vE
         hZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721080279; x=1721685079;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PuGKTD0bqaCNqwyH7ywYKEHXZHJXYd40xsrP5Ml+05Q=;
        b=MCJKN3KYM/xuKOsHnnZsq83TAZ4BLkWcHb40L8SC08hDyr6WuHyTkoeKL/HCBbQ5N/
         WB1+1+xnu7B/e5iUFG20picwVGkaiIJwy57GoDBDOS+ullMdBEbBXZsdWeLEYr5Q//9I
         41a98nI47zJjzTDFaPN/il3Xnh3LosWlLTcIsaltEoJtuSy4Z4ypTJ5bFP4sw7luHCfm
         uZ6txtac1dHpfG8fMGtyAQgsbLZcOxs9P35vgDPMQxvdQW/ZhoRvDBhVAA4QO6YVBww5
         fg9gvcNqQZCgtBHlKQV+YO8llnz0/yvRb9F1Yd1sGDVr2GHqc3DBNU19CMC7lWZ2m7lD
         GbjA==
X-Forwarded-Encrypted: i=1; AJvYcCUhsqrh38l3aMeZfVhTgorNCgW86v2bRlzfur1Li3UaEB3E0EcpLeDZmJlO4wM6LbQg+jaVzF6ln7umrk59Nv43CUFnehyWG3MdZIMTTQ9ec+z5/eaezf1RGkGkdGyQFzG0B1IZPhySaRc=
X-Gm-Message-State: AOJu0YydHhHY0HhgCNCsPJUJIZGA+qpcTvfQ1w6J8yQWUrB+ROaoDy1T
	L8ZTzgtp2t4p9eQ915PwMsNRXZ/8yEfDzm9kWv/GbgraGOIONhedz87nAFBYtwbs9FZYYcOnWCK
	Pf1rHe/QEkQ1roi+jeNfggab2E+U=
X-Google-Smtp-Source: AGHT+IGKempCiAskwViSue/XBabZPqnFmIGVUdyk4bjoTTfM7S8Q5yIcJXA2vohFOfDFgS8ldPk+PEdLN15SvUftZxw=
X-Received: by 2002:a17:90a:4885:b0:2c9:8b33:3195 with SMTP id
 98e67ed59e1d1-2cb373e4291mr145700a91.4.1721080279485; Mon, 15 Jul 2024
 14:51:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Robby Knipp <knipp30@gmail.com>
Date: Mon, 15 Jul 2024 17:51:08 -0400
Message-ID: <CABSVwinoDALdCFk5cB2bg7Zs8uOKkFZnJB4svEXcbMz4Dw1LCw@mail.gmail.com>
Subject: Re: Xinput Controllers No Longer Working
To: regressions@leemhuis.info
Cc: dmitry.torokhov@gmail.com, Edward Wawrzynski <ewawrzynski16@gmail.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi again! I likely will accidentally top-post this, and I am sorry for doing so!

However, my BZ was answered with what looks to be the fix:
~~~
That module is in the kernel-modules-extra package:

rpm -ql kernel-modules-extra-6.9.7-200.fc40.x86_64 | grep xpad
/lib/modules/6.9.7-200.fc40.x86_64/extra/drivers/input/joystick/psxpad-spi.ko.xz
/lib/modules/6.9.7-200.fc40.x86_64/extra/drivers/input/joystick/xpad.ko.xz
~~~

I installed the package above, and my controller now works as expected.

