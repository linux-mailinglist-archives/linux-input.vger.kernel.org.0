Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D00941B2A24
	for <lists+linux-input@lfdr.de>; Tue, 21 Apr 2020 16:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728422AbgDUOjS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Apr 2020 10:39:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30032 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728316AbgDUOjR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Apr 2020 10:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587479956;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S0m218wZ/56TxqZO6kDP4ZvWKrss3dIIueqJMa4a2lw=;
        b=KMuKaEbXbTavRqKW3pSJ8hBOQpw3Dx+/bkZm84CjD+c2KLmeKam91URg4wFkM+BEJwaYwD
        RW8vEXjMXWcl/sYL+PHZhZUZAgJpFf8SwK5oKo8WoVFdTyDDTtcADcxrCR5RZVu4nWyEaM
        52M17TaFBL3f3tBz7laxx+qgJbSKnnw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-6WqIwaeVN72OY4JHAwOZig-1; Tue, 21 Apr 2020 10:39:13 -0400
X-MC-Unique: 6WqIwaeVN72OY4JHAwOZig-1
Received: by mail-wm1-f72.google.com with SMTP id f81so1468333wmf.2
        for <linux-input@vger.kernel.org>; Tue, 21 Apr 2020 07:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S0m218wZ/56TxqZO6kDP4ZvWKrss3dIIueqJMa4a2lw=;
        b=oERVzfng0EpsgWrvWJXrZZMzi1l4202XRWCb+Yd1XDnZ33Ht+2DboRIKUbBUKvRc8I
         /Ye0Ybeoy9QPNiBbIhrZB/CE1lx5SmY9a2ThAfD81kH49+7HxfmJHVghL1JRTcxvfpOj
         AiXPsW67o443oQyHhTEauiP+hTgiiGk/wed/DryP/fN+7dkFo9dDdUpyxRwGRfCk7unr
         EKJyg+R5j4WJwV5AjIA1MMT7gYgdFyFS3eJNHdxRzkU3AhQmvK8KsPVp0ry+k9VXW2es
         /tINS1QcUTxa/ueMUlG/KyN4PdRunxR6sNd3HPgyHg9n38627IbLIpBU00qarahSOO+u
         reCA==
X-Gm-Message-State: AGi0PuawFAMWQEBrOhgSL0SmQ5ScOwxvGpK53zLBeWarou8ysgMdfL48
        /HsoERcS4o7F1dnANuh003HBC7JQmqDfnu4TDj307fiOcseouMMwfoBVsW3jXL+etYrVk6hrvEU
        lena7G/ONLTJ0oY5eG8uO/dw=
X-Received: by 2002:adf:de8b:: with SMTP id w11mr23246530wrl.48.1587479951360;
        Tue, 21 Apr 2020 07:39:11 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ+yN4dTm8VkFk/ovYvl/R/DDXw0NRWN7AN10KDCeH6px8Cp/6MaPZtflfa1oiRj3OxBOv8XA==
X-Received: by 2002:adf:de8b:: with SMTP id w11mr23246515wrl.48.1587479951215;
        Tue, 21 Apr 2020 07:39:11 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id x18sm3946792wrs.11.2020.04.21.07.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 07:39:10 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the ONDA V891
 v5 tablet
To:     Maksim Karasev <karasevm98@gmail.com>
Cc:     dvhart@infradead.org, andy@infradead.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20200421132548.5627-1-karasevm98@gmail.com>
 <1fd3919b-6094-9c33-64d0-e8775c4428bc@redhat.com>
 <CAFTSnMhSF39MeiRccRm1QB0nk1F19iZ0w5K_ChxVvJqGh9FMAg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3641ea31-6c16-10af-3201-6d6b80cbd460@redhat.com>
Date:   Tue, 21 Apr 2020 16:39:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAFTSnMhSF39MeiRccRm1QB0nk1F19iZ0w5K_ChxVvJqGh9FMAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 4/21/20 4:24 PM, Maksim Karasev wrote:
> Hello,
> Sorry, but I think you are mistaken,
> the v891 and v891w are 2 different tablets (different screen, battery,
> camera, and internal storage).
> My patch is for the v891.

Ah I see, so the v891w has a 1920x1200 screen and the
v891 has a 1280x800 screen, ok.

Regards,

Hans

