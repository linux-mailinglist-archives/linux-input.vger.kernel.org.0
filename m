Return-Path: <linux-input+bounces-5714-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8250F958DB0
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 19:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40614282C1E
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 17:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6198B192B66;
	Tue, 20 Aug 2024 17:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhTQ91UU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8F1482FF;
	Tue, 20 Aug 2024 17:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724176761; cv=none; b=OBpwV9ozsUSXSWVyTDnu9kW+/PM+tizwDPyb9a82fASd8noJa9FU9xjH4H0sVM/Krb98XyFIxVnSG4RuB21KalLboW/ehlB5DqjKxkoGp2NhJD0Iv7jdLWGxnFr+x3tLWVeEVCrfJL5qQIhCVThB/zMcc1+AgPzIkJPIRSNxezs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724176761; c=relaxed/simple;
	bh=KI9EYm6/jv4gaUt8hmpPSwl7gpvW3l8AVlfC5P0cpZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQEues0YaLJHdEu1qpjFxFXbfXnpigfVwG2BWkxBrT2QNA6hukZneUt7T3u3xhoCdubXVLD6OxNkzthPUhHCz1/XVjbaNfKMA0CXSVx+yd1pPYZA0GCHMZr57Vy5C6soEjhREJj0468vJNtlPJAjLGkFq//294AXcA5zZkjTgqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZhTQ91UU; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37182eee02dso3122778f8f.1;
        Tue, 20 Aug 2024 10:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724176758; x=1724781558; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KI9EYm6/jv4gaUt8hmpPSwl7gpvW3l8AVlfC5P0cpZo=;
        b=ZhTQ91UUhP00e/F2oqG/rnUVn/EM55L09Rczfl1BTBOG5/LkGeJvBEfGnpwIOnw2eZ
         AWy0Gqob1n9/9SVz7Xs3k8HheWzFGBiStKQPUS2mYdg9koDZ3MMHRa3fSw8/3aId7Be1
         tU767WPnZptl7U3Be6vfk+9FPZ1sh0gwUV0DdomoH5qH9YiKXfmKO3BX3njyClQA2Fvm
         +Q+JxTWQ63oLwUNqgfHxsoEFnDk4ledjpJ3LjT7BEXFOkiwB1p8nJQXKgNg4NDVY083j
         Y0st4D/QAcZ3GdZuyjwmzc9ywFp4lDQWbCgFRz+ZIWd1aHq0bza5Qz0ypa07eRxtZHnE
         OFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724176758; x=1724781558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KI9EYm6/jv4gaUt8hmpPSwl7gpvW3l8AVlfC5P0cpZo=;
        b=GFczgtHmRn+yCwvOKtUwUAVGsf8LXvhmdTRPzFVMKqPHkNscvVcXs7N7LFCMsnxTFp
         rjaCegcbwlX5n/1i1DtVlpnc+MEBpAWS0mOrpvA1JksTwl3mDcXBsC6QH5PZxsIq435G
         vkDM3jPswRWu10Z9bHS000VSxvwekLBDrsA0t2BBX5vg8eFQ0NqJjOFhkx3QlfCStMMj
         6TquYN0P15BTMltertTPSYplKewKEZ62Xrpeiz/1nm758EUkDyY0cd8DuRUeviAzcY6O
         2wXZ8Z6xzcnkrqOM9SG5gQHTCYXr9kB55ghEPrC17kaVX51cIOZJUEx3tQNMVJlO9Lkl
         s8wg==
X-Forwarded-Encrypted: i=1; AJvYcCWh/or5yItp5KRUTEEN+3xUbwAZYz7j17xMFnf9IWHww3QIXldbfZFy1MAPF3kKLmSb9aDiyxbwAmGZfCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMFlRsjd8AMnSa6t+bW6hfb1xxrXRseG+KcJQadh+Wvd2IgWAI
	/nu3IsR3I2tkZO+fGTELNVS2JypwQEMtLZbx85QSlZ3mG2FeFJLAC3RWeQP2hYFkricJm/Yj+cl
	heSjjDpoEJBMp8SY96z71FxZ3wmc=
X-Google-Smtp-Source: AGHT+IEQvJ5V0dB7gX//2smouFJnDe/h5dcDAIBrCHBFILgx2dzd1BK4S0GjXt3Ros2WvQhQBmfbqIr60VRdL/0Dto0=
X-Received: by 2002:a5d:6d43:0:b0:368:4488:66f8 with SMTP id
 ffacd0b85a97d-371c4ab1d8dmr2148623f8f.23.1724176757422; Tue, 20 Aug 2024
 10:59:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820002210.54014-3-stuart.a.hayhurst@gmail.com> <577e96df-5535-4530-ac62-edc53881a443@web.de>
In-Reply-To: <577e96df-5535-4530-ac62-edc53881a443@web.de>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Tue, 20 Aug 2024 18:59:06 +0100
Message-ID: <CALTg27mK9wPC_1sRzk-Z-NCm7a+25KrEYwB8=JQN62RrCASOOw@mail.gmail.com>
Subject: Re: [PATCH v3] HID: corsair-void: Add Corsair Void headset family driver
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Would you like to choose a corresponding name for such an enumeration?

I'm not entirely convinced it needs one, as the value names are fairly
descriptive

> Can any other data type be reused for this purpose?

I'm not sure what you're asking

> Would you like to omit curly brackets here?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?h=v6.11-rc4#n197

Done, thanks

Stuart

