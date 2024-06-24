Return-Path: <linux-input+bounces-4600-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BD7914FE7
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 16:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89390B22D23
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 14:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC835143C63;
	Mon, 24 Jun 2024 14:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UTb8ohZS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4789F13D8B3
	for <linux-input@vger.kernel.org>; Mon, 24 Jun 2024 14:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719239310; cv=none; b=ToLMuajHNc/VC1FJdVxPcm+txng2d6mMbT3c183eybFleci+iZe6lUGJpBf3y3qbbXJw0oJxBec/Dr3gJuW7rdoRtDa7h6ToY3oZT5afc6z7xSn5D36gb19et4K6WIZ/gRGmOeZC+FsrJM9bbrRpUOfqj2r8v8Y9/Wwk5Jt92MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719239310; c=relaxed/simple;
	bh=j3yW/z96FF8SUpUP6V7AyzKgmGiSp2jEP9gctQ8qesY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlN+xpDLHeSdJyJ0rBLJHmDjbHEOr6iEyfxTgztdwvfkfHdylSBq9ZLLmVVYEAPfLU1PFDkW/JXXzPcFIADZdB3A5UWaYHF3ClxalORLFCnbp4y0HSBDb/8TLJRykZdgdlfsvjOyZlxW/uAWXn7BrnJagcim1rrbblklA1Lcel8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UTb8ohZS; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52c7f7fdd24so5061973e87.1
        for <linux-input@vger.kernel.org>; Mon, 24 Jun 2024 07:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719239307; x=1719844107; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7su3gRoP2LrGxszjFo9Cz/0CPHsqkmxZ3xjVUAFtNYk=;
        b=UTb8ohZS/zYsBJMffvQDmSe6gBG1qxZeX2MI+KXLCuH1SiHpON1oRkMP//uQkW+3AE
         XZIkvAPwDxRjHorly+/rxVSETwMgHY6hyoAY5buiCs3jn6KefCIZwI6Y25N6ySjyMp39
         0F7+0S8ot0KpDtKDxScKNOzYJbrRt5YEHZzEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719239307; x=1719844107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7su3gRoP2LrGxszjFo9Cz/0CPHsqkmxZ3xjVUAFtNYk=;
        b=kFXxql+nzN0rFqbXLoXXQcNqMnBhFOIu9aHm39yxFy+eKI0oj1AMrSb/W/yaEWplHF
         Hb0EFL5deV8/RqNC06Ek72uk7HGDPs25IH61hfKVA5BiU8Vep8sMgVQh/c4pQyO/Wt3P
         bIPeV69HGy2IhNeqVgfJeLfbQYD1wS9eD7kc+UTWUHefR8qU/RPXphbc/a97+SKuHrIS
         XmBrTXOk+hcOYpurV/hQ9kRpHqhCk4fRqBKeLXUPOyL4zVjVaaxjiuH9CHUT6m3mbjRm
         VF++UYz3H73ELoefU6vC64rF5fdVdFnxeYR+QlDuPk0GW1YUZsJMut6cbu4JM3y+hBDR
         4AXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT9not7xxRjFIXalfoOWES4wU7D6+4QTboHIt4nMZlYf46rG+xgNxUrF5792/JW9LxT+SH6MlZCW3lA+aWrYRUCU72sfhgfvwmtWk=
X-Gm-Message-State: AOJu0YxpH73HKTPwx20b2MXYFRi+sWVirHXL3q9NzAdKxk4N/iOFz+7r
	WKQrENkLy0OxBAP4oHa/t4T+a2Fsa6L1+A0/Y0zlYavbIXE4R1EmospYXq5GOtpaV8OBaBsFFPQ
	SfPDqig==
X-Google-Smtp-Source: AGHT+IF73PMZ3viHgkvi50EN2mhmi3XBzN7CwA3I+vFxFKLK6a0S8ZVjnQsjl80f6ZVZo0sr0bkNzQ==
X-Received: by 2002:ac2:560a:0:b0:52c:d6d7:9dc4 with SMTP id 2adb3069b0e04-52ce185f926mr2876022e87.49.1719239307137;
        Mon, 24 Jun 2024 07:28:27 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce35b1e30sm441239e87.282.2024.06.24.07.28.26
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 07:28:26 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cdc4d221eso2714217e87.3
        for <linux-input@vger.kernel.org>; Mon, 24 Jun 2024 07:28:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXmsYhXT0VQiz6o5H3LQc/r7nQbblRyOKZpdIso4g/Hg558ms2yf7yWy1m3jFNt/XhP9ZNngM5QTQ+hJ9y5tQsu3HnJ9sZgQSCXVUI=
X-Received: by 2002:ac2:4c38:0:b0:52c:d834:4f2d with SMTP id
 2adb3069b0e04-52ce1834fd8mr2761302e87.18.1719239306227; Mon, 24 Jun 2024
 07:28:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZniqQuGkosZYqIYE@google.com>
In-Reply-To: <ZniqQuGkosZYqIYE@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 24 Jun 2024 10:28:09 -0400
X-Gmail-Original-Message-ID: <CAHk-=wj730guvRzh4wo16Cq8tq1D1tyD8ub4CiBxV4Bk0Kq_-g@mail.gmail.com>
Message-ID: <CAHk-=wj730guvRzh4wo16Cq8tq1D1tyD8ub4CiBxV4Bk0Kq_-g@mail.gmail.com>
Subject: Re: [git pull] Input updates for v6.10-rc5
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 23 Jun 2024 at 19:05, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> Please pull from:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.10-rc5
>
> to receive updates for the input subsystem. You will get:

Nope. I get something entirely different. I think you tagged the wrong state.

              Linus

