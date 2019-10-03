Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E524CAEB3
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2019 20:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729403AbfJCS7G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Oct 2019 14:59:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33672 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729355AbfJCS7G (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 3 Oct 2019 14:59:06 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id E9B363C916
        for <linux-input@vger.kernel.org>; Thu,  3 Oct 2019 18:59:05 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id n3so1527018wrt.9
        for <linux-input@vger.kernel.org>; Thu, 03 Oct 2019 11:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uWnq444wnNCmD6KwthWmL83QqiER8aA9oBPNZG1Z1bw=;
        b=aJkTpmbzepoghvPrv2AMjEzcDymDjd4n+fyt3H3A4y0EfPZ1M8O/7tB26/gDAhKpDh
         RD1aYPw69SJT5cRLl7EzVd+ll8PZsM+v3R7MKRhl/ar8lsXoF3utpe4exSdULsma32jH
         edgsD02stum5hrmNDFcRoYnB5lYTZ0+k5NoIk9qp9gFgwQP+LNUE4NH80ynh8vLHikHO
         0Im8yRKnWUj+PZyExv3iNFi4NBsisTOnbp5yadjrNg1PQeFWIYWvl1Dwf7IwtCfdzssX
         NP9escT4wTy2/Vn70AXevsb/q0NE33hYuj3+qB36TkRUBoDb3Ndo7jgaQDwYUG5lu5uL
         w7/w==
X-Gm-Message-State: APjAAAWJblwWLgYEBnJ2XvY9calqFKXiyXO9DkFymWLoHYcYREaKB+O3
        CbLYI/iS/wK6V/cm/IrOlM2/lg63ZFKybFke6th/xz3BkfcdM1+E3N2BKFppg0fiVUc97RqQmuq
        +gVl/FjP+Kke8lsjvZ1Cr7CE=
X-Received: by 2002:a7b:cd99:: with SMTP id y25mr7977606wmj.152.1570129144266;
        Thu, 03 Oct 2019 11:59:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyUcZ8Y3AZrLYdgF7Xq96Tq6wRwSk2Zs9tpXMtyUUYOfGnpknwEnejk1jJZUjzNI9IgSi2rMA==
X-Received: by 2002:a7b:cd99:: with SMTP id y25mr7977594wmj.152.1570129144093;
        Thu, 03 Oct 2019 11:59:04 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id 79sm5692709wmb.7.2019.10.03.11.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 11:59:03 -0700 (PDT)
Subject: Re: [PATCH v3 2/7] HID: Add driver for Logitech gaming keyboards
 (G15, G15 v2)
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
References: <20190828124130.26752-1-hdegoede@redhat.com>
 <20190828124130.26752-2-hdegoede@redhat.com>
 <nycvar.YFH.7.76.1910031540530.13160@cbobk.fhfr.pm>
 <378599dd-cd9b-98b3-0c8e-b6e7d6a01a06@redhat.com>
 <nycvar.YFH.7.76.1910032044520.13160@cbobk.fhfr.pm>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <54509245-1c89-3e1b-df30-d8166fb63250@redhat.com>
Date:   Thu, 3 Oct 2019 20:59:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.1910032044520.13160@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 03-10-2019 20:49, Jiri Kosina wrote:
> On Thu, 3 Oct 2019, Hans de Goede wrote:
> 
>>> have one remaining question -- what is the reason you decided to factor
>>> this out as a separate driver, instead of putting it under the
>>> hid-logitech umbrella?
>>
>> I put this in a separate driver, because it is a substantial chunk of code
>> and the gaming keyboard stuff shares nothing what so ever with the other
>> Logitech bits.
> 
> Well, we generally keep the support really divided on the vendor
> granularity, even if code sharing for individual models is minimal.
> 
> I mostly personally prefer that due to absolute clarity for people making
> CONFIG_ decisions, but as you put that under the generic Logitech config,
> it's not a big issue.
> 
> Queued in for-5.5/logitech now.

Great, thank you.

Regards,

Hans
