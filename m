Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6303A456
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2019 10:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbfFIIXb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Jun 2019 04:23:31 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:42789 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727284AbfFIIXb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Jun 2019 04:23:31 -0400
Received: by mail-ed1-f66.google.com with SMTP id z25so9137477edq.9
        for <linux-input@vger.kernel.org>; Sun, 09 Jun 2019 01:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lhPGpoZCXInWW+WzaFI7OBYJIKXJxu/h3R+F+xDwIu0=;
        b=X/ccafUTcmLs9AZIwmYMCv3J0igwoHBYFkgl0rLZt70YQS5HhJCHIVExbPEu2Q2LXU
         bazMnSYrsLTNi1odoObUnV9keVn/o4aUBZG62Gaa4oZUidspTxA97lDoR+YYJYgLBR8L
         q98JSluv5v5z1InUdpbHFBG/FEx1TqoQe9EUFfI4+D6fmgpQTdN5cFlA5DGh5zx8sR+s
         XYnUyGWGPmNMBTvzpIQG2N1kKFrIgYB1TS4/M4RgXbz1kRO8hOsb7GqXdBKI/HTWxjOu
         1jOVrL8k4uEiM1ySmwBBw9RcU5iAKjuSl4XTWvoHsPFzW9GxCf9uyqrvE2Mx39dkqm4r
         j92Q==
X-Gm-Message-State: APjAAAVayZAb3tr/pG2Fteyv9uzQRUYLINQzEt3Gi4sJR7OC8THICVQw
        yZ4VfUwoey8qOSvFKdM22U230W/M3xo=
X-Google-Smtp-Source: APXvYqzgXfMqZ7ZeaBAh/ii1k2nx4hlyAlLMuWb6EpRsBO9Bl7qnumOGD3mqVGBf2Fqk0NYLd3Vckg==
X-Received: by 2002:aa7:d711:: with SMTP id t17mr67047005edq.80.1560068609112;
        Sun, 09 Jun 2019 01:23:29 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id u13sm1978233edb.45.2019.06.09.01.23.28
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 01:23:28 -0700 (PDT)
Subject: Re: [PATCH 0/7] Input + HID: Add support for extra keys and LEDs on
 Logitech "G" series keyboards
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org
References: <20190520181525.4898-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <667518bb-d788-11ad-72b1-68c93ef7f807@redhat.com>
Date:   Sun, 9 Jun 2019 10:23:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520181525.4898-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 20-05-19 20:15, Hans de Goede wrote:
> Hi All,
> 
> Here is a patch series adding support for the extra keys and LEDs on
> Logitech G15, G15 v2 and G510 keyboards, as well as adding support for
> controlling the keyboard backlight on these models.
> 
> Dmitry, the first patch adds a bunch of new key-codes for these and other
> similar keyboards to input-event-codes.h, the other patches depend on this.
> It is probably best if this patch is merged through the HID tree as part of
> the rest of the series. If that is ok with you, can we please have your ack
> for this?

ping?

Dmitry, can you please review the first patch in this series (should be an
easy review) and let us know how you want to proceed with this series?

Regards,

Hans

