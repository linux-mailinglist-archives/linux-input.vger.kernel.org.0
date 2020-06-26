Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C45520AB07
	for <lists+linux-input@lfdr.de>; Fri, 26 Jun 2020 05:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgFZD5J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jun 2020 23:57:09 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34529 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbgFZD5I (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jun 2020 23:57:08 -0400
Received: by mail-qt1-f195.google.com with SMTP id u17so6569270qtq.1;
        Thu, 25 Jun 2020 20:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kJ7+MitTL2u/SJRdhAtn56mONVO+G9P0+BelTtfOntQ=;
        b=XrvNW5GEmIteQN5fyPzMHlQNlWJVe3yEKh/9II3S05JuZAoQ3YaJZZAvv9zfk+Cldx
         3k0LDGkR4k0J1l5wmjjnjer+L2tkTRWkNBKjye2/3P6mYyFFgLG1+WkXP//cJg9wpvPD
         ykT7AaWw+PWGVcd8UO+0Zi2TMNvmluJwPwH5Po5j0eEF5UQ5xivfdCjMp2J0gy49KFyo
         6kab7XlawMWW9GQZbIuqfjHX7g3P1sgJ+QVl/RR9fmKmgFRCaC2yDqTsYXeQYId3ntLb
         Bw6pKhbrpn8qoqad1Z7vzh7JxJJAp6AO1d9rX5KVM/qTUPbeyforVCZ6RjyfPJf+8qA2
         3Jkw==
X-Gm-Message-State: AOAM531NUWaBYvv0g6N++zbyQjKEQuvQi+xVDZz6vVVTgPb0TBCkVJfC
        o4JwrzzP9kOQlYETelkKB/s=
X-Google-Smtp-Source: ABdhPJzHeWvgQQatmv437XIWqbm5ZKPH0mBAGfUhz/q3ue1X7/V6sFcuCPelEhGM2P8bFw5pMBnCaA==
X-Received: by 2002:ac8:2914:: with SMTP id y20mr862187qty.30.1593143827688;
        Thu, 25 Jun 2020 20:57:07 -0700 (PDT)
Received: from dek-x230.localnet (pool-108-24-134-99.cmdnnj.fios.verizon.net. [108.24.134.99])
        by smtp.gmail.com with ESMTPSA id x53sm2240861qtj.63.2020.06.25.20.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 20:57:06 -0700 (PDT)
From:   David Korth <gerbilsoft@gerbilsoft.com>
To:     David Rheinsberg <david.rheinsberg@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] HID: wiimote: Initialize the controller LEDs with a device ID value
Date:   Thu, 25 Jun 2020 23:57:05 -0400
Message-ID: <2516866.vuYhMxLoTh@dek-x230>
In-Reply-To: <CADyDSO7HKNP8ihsW2-qouG5SYpOJ1LfD2sAbDfRkJ3iSkHvGNg@mail.gmail.com>
References: <20200622225728.330-1-gerbilsoft@gerbilsoft.com> <2498150.lGaqSPkdTl@dek-x230> <CADyDSO7HKNP8ihsW2-qouG5SYpOJ1LfD2sAbDfRkJ3iSkHvGNg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thursday, June 25, 2020 3:09:46 AM EDT David Rheinsberg wrote:
> Hi
> 
> On Thu, 25 Jun 2020 at 00:09, David Korth <gerbilsoft@gerbilsoft.com> wrote:
> > I've been manually setting the player IDs on Wii controllers when running
> > multiplayer games by writing to the /sys/class/leds/ directory. Having the
> > hid-wiimote driver do this itself significantly reduces setup time.
> 
> What do you mean with "reduces setup time significantly"? Why would it
> take that long to set the LEDs?
> 
> Thanks
> David

The LED setup in this case is done entirely manually by me writing to the 
individual files in /sys/class/leds/. This has to be done when the controllers 
are connected initially, and if a controller has to be reconnected for some 
reason (e.g. it runs out of batteries). I don't know of any userspace tools 
that would make this easier to automate, except maybe a shell script, and I'd 
probably still need to run it manually.

Both the Sixaxis and Xpad drivers appear to implement something similar, so 
perhaps a higher-level "player number" mechanism that works with all 
controllers would be worth looking into. This could in theory be done with a 
userspace daemon too (or a udev hook).

As it is right now, I still think implementing it in the wiimote driver is the 
best method to keep it consistent with the rest of the drivers without having 
to install additional userspace tools.

Thanks


