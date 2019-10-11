Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8AFED42E8
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 16:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728195AbfJKOba (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Oct 2019 10:31:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33832 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728556AbfJKOba (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Oct 2019 10:31:30 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id BC63ACD4CD
        for <linux-input@vger.kernel.org>; Fri, 11 Oct 2019 14:31:29 +0000 (UTC)
Received: by mail-ed1-f69.google.com with SMTP id 38so5891140edr.4
        for <linux-input@vger.kernel.org>; Fri, 11 Oct 2019 07:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e7jeAeBI7smw0DkvEKb+yEiLD6lnpDm/GMM/0BPj+Sg=;
        b=kPlXQAN+qCsBAy8+cNao9Kog+LRoJXuco0mwykeNpsR7ZxZ0b9Tod3EJUqhgL8tQKf
         EG0a0I3ZJU+HeT2VquvCi1etTafhfMtMVIz7dqdGYu659y7/fKXPZWwLziP+QRcf6xFq
         psrupfBwP00/YvLQjs6XcBgaX07Vq2Q9/VLL1tZtKgOOFwP0f5IvguS9rmFlHLuXdWTV
         eZZQn2wWWMg7wBVZo41kS79rUHRl9Exthk7SnGb0zDJxxkpte0Rn9EFPjNOE7JY/CsOe
         vfD5e7SM0TbRsDKoLBD34peRLuQa3w+X66hvaf73TIhTDOtKULKccdq/YqbD8+nYVyAE
         sVRw==
X-Gm-Message-State: APjAAAUyCmlbc/x/tUZGw2/1Zw45pP/RiJZgnK32ZYmmsXSOdyk/DC62
        ySOiE08EaGUbhYSsB3xt9qtGBP4WYZ+INW0V7rLQku0rAJZXbP/W1gY78rgJS2X9pw5ZjWBFK7j
        omPgLFNtAQrngADdmQs8Kf7k=
X-Received: by 2002:a17:906:2319:: with SMTP id l25mr14159782eja.309.1570804288243;
        Fri, 11 Oct 2019 07:31:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwoRZoAH1NMErSVdJalwF7TdgOzUSOFWLs4mQa22TgCcFbTlVZIC719vTCBSczupc1e7bsjHQ==
X-Received: by 2002:a17:906:2319:: with SMTP id l25mr14159752eja.309.1570804288071;
        Fri, 11 Oct 2019 07:31:28 -0700 (PDT)
Received: from dhcp-44-196.space.revspace.nl ([2a0e:5700:4:11:6eb:1143:b8be:2b8])
        by smtp.gmail.com with ESMTPSA id s22sm1224314eja.91.2019.10.11.07.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2019 07:31:27 -0700 (PDT)
Subject: Re: [PATCH v7 0/8] efi/firmware/platform-x86: Add EFI embedded fw
 support
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Jones <pjones@redhat.com>,
        Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20191004145056.43267-1-hdegoede@redhat.com>
 <20191011141036.GK16384@42.do-not-panic.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7fed4882-efa7-18d0-1ef6-9138fbdddfc4@redhat.com>
Date:   Fri, 11 Oct 2019 16:31:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191011141036.GK16384@42.do-not-panic.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/11/19 4:10 PM, Luis Chamberlain wrote:
> Hey Hans, thanks for staying on top of this and follow up! For some
> reason the universe conspired against your first and last patch ([1/8],
> [8/8]), and I never got them. Could you bounce these or resend in case
> others confirm they also didn't get it?

I have received feedback from others on the first patch, so at least
that one has reached others. I've bounced patches 1 and 8 to you.

> While at it, can you Cc scott.branden@broadcom.com in further
> communications about this patchset, he's interest in some other changes
> we'll need to coordinate if we get to have some other development in
> line for the next merge window.

Will do.

Regards,

Hans
