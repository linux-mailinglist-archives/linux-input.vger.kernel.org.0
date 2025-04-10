Return-Path: <linux-input+bounces-11699-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91875A83DFA
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 11:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A553D8A6D2B
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 09:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D8620C473;
	Thu, 10 Apr 2025 09:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmhWSIJa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1BC1F03FB
	for <linux-input@vger.kernel.org>; Thu, 10 Apr 2025 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275729; cv=none; b=i8j7edVn19VBIg+PVZ0Izi/DHrYQydJsAIqusT5UMzaTVeJ3k5Ockpv5NHqv9ieeS4iEmwA8vyeMBiKx8L7zJJBZcBHQ4vdrqQbkK7+BGLtQ+MNKlPr20Zc82jpOvHyml0FyvvpOTOmN10GgWqz5bPof7MkCQ4ZFiMhufOqGRQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275729; c=relaxed/simple;
	bh=neOoW4NYIFfqFHjBtRcRmHBdZ0AXIW1RUyGciTAOq9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COGlN4SVNILslk3tHDWgGmAnJJdSMhliuSXWiJ6hMjg9Mxy/j1tUUZ4UtUWqn02qYtnFUaknnHEXT56Ak/agvS9rrnEtaofE+aQo7x6JKCn/5ruJBKRZ8kAxOczPDYFvowDTIfCEEeIBy5QGCUZpcw18KG1W40G+G2F8EdPyqhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmhWSIJa; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736ee709c11so409585b3a.1
        for <linux-input@vger.kernel.org>; Thu, 10 Apr 2025 02:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744275727; x=1744880527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TudbmOOOVPuynx6RHr7L2tIMVRswgkea6TccnNcFDoE=;
        b=JmhWSIJa8DdB7WLfX80YkCJ2o9xXyWaNMNsSJYGA5Mxtq3AvOGp+3yEEG88EIKYaCu
         ao1oh2pKNeq6CgRp90TEfO2V2ERwFyUfvP35hKRPfY8OPyvQjzVxX6avDxr9ugoC10Vs
         BX8ohGefj+e67pVaskMi4fEdr43pWOsJSZHR+NnVbJqg8jB2YY+w/2n+SvTIAHg9bcSm
         ljMVJRLuk1Z984BHR7/4uwokD29OI4zFc3s4cbVa3mmPtwEFUtUZIigjmRPizaPdNhi+
         Oi4/ZshFXLaZbTI42XcPr/LiD0YlUz/61uFOG4UNPg4pGreCw4LdGzyRAsG87tujYXMQ
         QqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744275727; x=1744880527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TudbmOOOVPuynx6RHr7L2tIMVRswgkea6TccnNcFDoE=;
        b=hTucIL4BLQ9Qluk2nRP4v69tehkEIzgtjz48xOv0qKesNmi0q6hAty1kleqc7ptzeV
         KCAxDfUojsqYvJE3ZF9gSpathrgdDtrLXPVvb6Wydvh5XExFWkfT54XaHXbPuU6uIjFG
         DBvQpp3Z21lY5FiLGC/CH2wfv8HCAQR5Qf+Q3KEki89nyGg9a5+v+Mx7HvGMVLI+fXcI
         4JGfAjt7HE5pIrG9/+jB6sPoPe6cy1cU6yOsB3rA56lTKrC1QVHxggQ6fiLEB1sJ8+bz
         sKcW7zoxLB4YjLGM4ROlXISeFQrwK0snkAt3T3LckSx9kvDcDflXYZOds5fS54ql4GZJ
         scpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu0Sj/oXFas2F5Cy9ZEuePugTrR3QvTykntuMl+jibIh8QcB3MZVanNNDE0pqNjnpsDqo7sgnAt4LqWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1CbldpQ8/x96JbMJHi8YLO3TiPKTVECX/Knj/ggK+NmCV9DVI
	4pFIwWTqYH83cI9jRYISsxOiCq/9N6LGrJy9ruqiuaxKnm8/+0lZ
X-Gm-Gg: ASbGncuDQEn+J1wRhFHsTeOwOrdZeqexHC5z2GmOUbUp8es7+nr5wb1yKqdq+viJpJL
	p2D99HCYKfhkT/iY6/QnmiSg747KaOECp7rD//5ikoley9d3VeNc/L0cU36O1xx547lB5b1RBxz
	JwJds8rC2S8DeLxsqb+yp714mbkkglvzPpiBg1IJY4Mz35vj6ruL1L3j+dxAD7ktQKVX5xBwRkR
	J8vcQg0pTxm0VzJFHUgbYIqZy0Qm88KK5c2pdRQEj8FmvVho1fiFA//Q15NI4bnJzKS6a32Jv7t
	kO0vV79p1Bo1Sq35cY+ZuTdbb0seEe6jAh0GL6hqyA==
X-Google-Smtp-Source: AGHT+IGFEzX5kFzqcJ9pd0VDuNU+IQkFlEEUSo5MrYnJGAmU/N+NIkUcpu4RcDWN4yYmlv2uOL9JEw==
X-Received: by 2002:a05:6a00:cc4:b0:739:56c2:b661 with SMTP id d2e1a72fcca58-73bc0a736b8mr2010693b3a.12.1744275727172;
        Thu, 10 Apr 2025 02:02:07 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:cff4:8871:54bb:4c97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e3813bsm2815179b3a.105.2025.04.10.02.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:02:06 -0700 (PDT)
Date: Thu, 10 Apr 2025 02:02:04 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: jt <enopatch@gmail.com>
Cc: Aditya Garg <gargaditya08@live.com>, linux-input@vger.kernel.org
Subject: Re: PROBLEM: Synaptics TouchStyk (trackpoint) on HP EliteBook 850 G1
 detected as "PS/2 Generic Mouse".
Message-ID: <g7xqjium63zvujt55nng3imurlan5smkv56ad7em4kfnzmmseg@a3lcjlmzcowh>
References: <CAAbCkm+hdmJ4ozW4viBkwp+7QQPgymA+bfb5ddOUCB=kaBvF9w@mail.gmail.com>
 <PN3PR01MB9597EA06B5B28C50A8CBBD3BB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAAbCkm+v4EV2TgkfMSGjYNvy_HgXSYAm2cFYjjrA4tv+WqBREQ@mail.gmail.com>
 <sxipdsuhfffda56hwlvajai3pfxamcefbvyu6mcwr4nmgsri6a@hfblyrc3hxau>
 <CAAbCkmJVWu9x4=68aKM+LNrU1BZ1bJm5TVoye3qGryw3yfF43A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAbCkmJVWu9x4=68aKM+LNrU1BZ1bJm5TVoye3qGryw3yfF43A@mail.gmail.com>

On Wed, Apr 09, 2025 at 11:54:44PM +0100, jt wrote:
> On Wed, 9 Apr 2025 at 22:19, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > What about the main touchpad module? Is it still identified as "SynPS/2
> > Synaptics TouchPad"?
> 
> Yes. Please see the attached "libinput list-devices" output and both
> udevadm outputs.
> 
> > Could you please boot with "i8042.debug=1" kernel command line option
> > and post the dmesg?
> 
> Sure, attached.

Thank you for sending the logs. Let's start with the main touchpad. I
see in the logs:

[    4.293334] psmouse serio3: synaptics: queried min coordinates: x [1366..], y [1238..]
[    4.293400] psmouse serio3: synaptics: Your touchpad (PNP: SYN3003 SYN0100 SYN0002 PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are not used, you might want to try setting psmouse.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org.

I also see munch of "MUX" errors in the logs. Please try booting with
"i8042.nomux=1" option.

Also you need to enable the intertouch mode
since the PNP ID of your module is not in the list of known intertouch
devices. If psmouse is built-in then you should add
'psmouse.synaptics_intertouch=1' to the kernel command line. However if
psmouse is a module, you should add "options psmouse intertouch=1" to
modprobe config.

Once you done this the touchpad will hopefully be in SMBus mode.

And please send me another dmesg of boot with the above config and
i8042.debug=1.

Thanks!

-- 
Dmitry

