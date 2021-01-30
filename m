Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C32E309837
	for <lists+linux-input@lfdr.de>; Sat, 30 Jan 2021 21:29:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbhA3U3Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 30 Jan 2021 15:29:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34037 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231907AbhA3U3P (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 30 Jan 2021 15:29:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612038468;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JCzTXndvO6PUCmY4kSZIvx2ZZ5a0W/Jzz1ojxQurW9o=;
        b=Q7Li6XMNALV/M2caQ3VVhbUdvZuOs32gM4UZLGz4YcTYbq+wd5nZj1v14zxCEsrZOhgSbT
        eYagB19YO49gPMdbwS0oTSzxWZfDpuoKZydEsq5PtZ91+PnIAitvHr101DEBRuiubPDq/f
        kQrgM52A5Vb7/1uxC7rOB1cRJmE0IRY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-YvOFV17MNwOuF7BwWwBKzg-1; Sat, 30 Jan 2021 15:27:47 -0500
X-MC-Unique: YvOFV17MNwOuF7BwWwBKzg-1
Received: by mail-ej1-f70.google.com with SMTP id j14so5846459eja.15
        for <linux-input@vger.kernel.org>; Sat, 30 Jan 2021 12:27:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JCzTXndvO6PUCmY4kSZIvx2ZZ5a0W/Jzz1ojxQurW9o=;
        b=gYCyREtGtDuN0K6PY1uS4UkmToWZMVNUOTeW19ppcUYGnxGvpsuBDdvL8i7JU6kV6U
         1/oGbzKhS5iV0EJiQ6L/V9QvBfbMeaHjMYyGh5YvXZ4bisrIo5dnAzqgHXzajAzusgiq
         suNFyHncYYqlScOWYlsgqEZG5todE6Of+NpTwPR6NV7A3R1Nxaw9S0N4brzwj3/dX929
         kyQDFE6ezMLqPi1fy13INo4Iz52h9L9yOxAHHSbmxJBUZvu/HImK/v1oRorC4cLS/H0g
         DYjWLTvuDYTqGrno3A22Tdr5hI+J9bsxa7g64zXHULD2cGddL5K5K/X3y2diH8guLBxR
         F5sA==
X-Gm-Message-State: AOAM5339mqBJpJiicgMbhFMynnJgm3910TxiAigibxAWtcqQRZIhJUfw
        c7+M57/NITzNRgwobcXW6uVgzUtgW8zW/g2rbJJ0UMbDLUb4mDwDZES9D2OL4oEumCrQy55aH00
        2a8Bs6WT79j1LBEZut0lwesI=
X-Received: by 2002:a17:906:7c4b:: with SMTP id g11mr10446947ejp.475.1612038465342;
        Sat, 30 Jan 2021 12:27:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaO95mOA2n0ZugO4ADrDuX4NF9Msehjm+Ssg5gvE+5YTUmMoNIdPDh0Rv+ywbXdR6FmC1zjw==
X-Received: by 2002:a17:906:7c4b:: with SMTP id g11mr10446944ejp.475.1612038465211;
        Sat, 30 Jan 2021 12:27:45 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id u18sm5651498ejc.76.2021.01.30.12.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Jan 2021 12:27:44 -0800 (PST)
Subject: Re: [PATCH] HID: logitech-dj: add support for keyboard events in
 eQUAD step 4 Gaming
To:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        linux-kernel@vger.kernel.org
References: <20210130191027.1225465-1-lains@archlinux.org>
 <265604c19e2e875ca17e4cf713000492b9ffd8d8.camel@riseup.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0a3aa6fb-3f22-d6f5-1748-42430f6e7ccc@redhat.com>
Date:   Sat, 30 Jan 2021 21:27:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <265604c19e2e875ca17e4cf713000492b9ffd8d8.camel@riseup.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 1/30/21 8:14 PM, Filipe Laíns wrote:
> Hans,
> 
> You added support for non unifying receivers in
> 74808f9115cee2bb53e7161432959f3e87b631e4, could you please test and make sure
> this cause any breakage with your devices?
> 
> AFAIK, they could only break if they have a 0x01 report which is different from
> kbd_descriptor.

I don't have any receivers hitting the "case 7" which you are modifying,
so I don't expect to see any effects of this change on my hw.

Regards,

Hans

