Return-Path: <linux-input+bounces-4602-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 583A591563B
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 20:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8C281F21859
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 18:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C877B19D8B4;
	Mon, 24 Jun 2024 18:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Q8fWcpKC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6307266AB
	for <linux-input@vger.kernel.org>; Mon, 24 Jun 2024 18:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719252672; cv=none; b=aHSQ4yzA3Uf45X2UAJT+IvWCCNRBYqs2p9oWjouGOl5FbQzprfdCNqrZb1yWhFvMWJqg2aW8sfLAn0VLePG0j60zWR5NfGH7+/ZM1+u7gJao+cqa8w4NPvaA3DCsPqSkxEu7ToP5cDtSBpVrPCVWkE8UepTSYXnZe0+/p2np9sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719252672; c=relaxed/simple;
	bh=9RbQgTCqCFSALgUc/JRqpUmZQvIwc1hyoGU2TywvaWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VwRXECkvY+HMNQ5lP/N0eoRuC1KpxmWYGlfoYeHAxvUPkwcJvIW8IImiG4QeZHEX7Ise1+AaSkFwKwZgNXzaU5I6RkH96pTrDhzpFZ0vD4AF311fEKXkbLRVDL+WAmpLVvm7w0KzKnRgoQXNBcQjbLDqdYbLMGxL3FofMTcVgJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Q8fWcpKC; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a725282b926so182965066b.0
        for <linux-input@vger.kernel.org>; Mon, 24 Jun 2024 11:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719252668; x=1719857468; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xeba+taLfwoM/yTWpKlwizK8Xk6HSTOMdLsJyeBt0rM=;
        b=Q8fWcpKC9BhNOx+sqFUZp3Vfo+VGYSDsQn/5d+6hEADfP9BTgFTmhhJVKXI4sBrxOZ
         pYMELWd1kTqaM9Y/giewvviF9m7M+gI0H68L7UEK5XEpyTdeEErqCIqCe8Yn4HYzWgFr
         yycwZ2VkU/5WXYibbZBDcYz2rjzohws4zUjec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719252668; x=1719857468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xeba+taLfwoM/yTWpKlwizK8Xk6HSTOMdLsJyeBt0rM=;
        b=TdMhh5bhWLUDBJ6xu9wFy5Gx/YbFqHj02+GIDDy6vpJYg+EdUKnEoUbEBTSay3K/xw
         gdbOrUoVSWeGNbsM9JngVON4GMcsnoFDYNy+Z725Poi7unPRqK1X+AO21TcRyoKMtr4i
         K5L0coqiZIvXWWObfRT4FXEhypjvLYtEJyLIgXFo04bsFW7sjDMXS+sAlgF68FitKgUm
         JkjFyp87ng1MijI0pLcnlov+RrXjDcF6UamOxLqgoKR1lf8upyzLbBkNMnGi630Y/nmv
         TCvJqz741jqkOCS3ZqBx2FDEWeUuAPKccrTgw+CnlcDzoUFt4DqryWJMG2XXivmudvbl
         s6BA==
X-Forwarded-Encrypted: i=1; AJvYcCWkzDHCpZMO6u5IsWTuQRTGmW44fNVX2EPo5NXgm6rqqG6O4nVbgukXclnG7SdW3YIT/0D11kDOQpAN+zzMFMgcr+Wqne3jjhrtAH0=
X-Gm-Message-State: AOJu0YySG03n/6wLxYD9o3Z4lLf3fJgfxYEHi+n4+yrX+/F37VPfbXPN
	o/o2ecPQzZRh2GW49LK6zS4e59R6Edk6Q9nolvVaYcYB/v+Go4HaLFw6UTo+I6RpPpIgbsYbMfz
	lOzLjHg==
X-Google-Smtp-Source: AGHT+IGji0s7oTi2HBOfdLSRJD3K1v2FA7O3VQMQ7mpG3TnEUksINJuXV05/7uzswKRhwM5a5Vjj3A==
X-Received: by 2002:a17:906:3c3:b0:a6f:b08b:86ca with SMTP id a640c23a62f3a-a7245df73b4mr308763666b.75.1719252667906;
        Mon, 24 Jun 2024 11:11:07 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fe0f2bd06sm326173666b.81.2024.06.24.11.11.06
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 11:11:07 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a725282b926so182960466b.0
        for <linux-input@vger.kernel.org>; Mon, 24 Jun 2024 11:11:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxqEJs58+1gJIz7hFGIcGRjbptMXafF5hjcM9nmrXb/bz1z7ygTuCeUFgGtueWklN0DlpyQj8AM6xC0/oTCirArlSEt3paOY+N6RE=
X-Received: by 2002:a17:906:6d4b:b0:a6f:ab9c:7778 with SMTP id
 a640c23a62f3a-a7245cece82mr312240066b.34.1719252666566; Mon, 24 Jun 2024
 11:11:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZniqQuGkosZYqIYE@google.com> <CAHk-=wj730guvRzh4wo16Cq8tq1D1tyD8ub4CiBxV4Bk0Kq_-g@mail.gmail.com>
 <ZnmX1XeOzU1NfgrY@google.com>
In-Reply-To: <ZnmX1XeOzU1NfgrY@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 24 Jun 2024 14:10:49 -0400
X-Gmail-Original-Message-ID: <CAHk-=wh3ZpDhHseFjYf96CcgTSRoZtjbf41hoBCyfQJ=N+oMng@mail.gmail.com>
Message-ID: <CAHk-=wh3ZpDhHseFjYf96CcgTSRoZtjbf41hoBCyfQJ=N+oMng@mail.gmail.com>
Subject: Re: [git pull] Input updates for v6.10-rc5
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Jun 2024 at 11:59, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> Ugh, I was on a wrong branch ('next' for the next merge window) when I
> created the tag. I'll fix my script, but in the meantime should I:
>
> - blow away the bad tag and re-create under the same name as before
>   (input-for-v6.10-rc5) or
>
> - blow away the bad tag and use new name for the correct one (somthing
>   like input-for-v6.10-rc5-fixed)?

Either works. Some people just re-use the same tag name, others will
always use new names. I don't personally worry about it, and whatever
you feel better about works for me.

               Linus

