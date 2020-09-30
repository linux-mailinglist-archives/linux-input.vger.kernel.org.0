Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC0527F317
	for <lists+linux-input@lfdr.de>; Wed, 30 Sep 2020 22:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728270AbgI3URi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 16:17:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24618 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725799AbgI3URi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 16:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601497056;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qR0BZGseTHbNL/WE5CgD2uGFUcNr181CvLX3hUZ/yRQ=;
        b=Ea6r84Vf0xCjaG3RP8D8kovVbUp6dJIbO4L2U2sF6T6OXWUvrdOHHMRYpAs/EbMx1Y1G6K
        uqNsbULv7gDHmkKh1pGqajwAbY9qBmb2Wp5sZTF7iZ45R7YNeevmFX0fghEx14bO/SB9de
        yEZ4I4DMkPddAyd7WjGTQrmqrnflX9U=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-NCRFT1OcOlmzucBTwvrRVw-1; Wed, 30 Sep 2020 16:17:33 -0400
X-MC-Unique: NCRFT1OcOlmzucBTwvrRVw-1
Received: by mail-qt1-f197.google.com with SMTP id g1so2025130qtc.22
        for <linux-input@vger.kernel.org>; Wed, 30 Sep 2020 13:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
         :in-reply-to:references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=qR0BZGseTHbNL/WE5CgD2uGFUcNr181CvLX3hUZ/yRQ=;
        b=ncBqrXJsjqXKDSpi4Q4kO2bUR/emljZMxKZbzDz/oXH7xTaZWQyuUFyUAxS9+BpIB1
         m2Rgdywi6Toq123BGHW3G1kPx2qKDadSa42XJ2T/zyZk388o8O8q7dqD4LkaapKL2sU6
         +RyJlviW2kd3iIHKZGMI5Jv6f/6TeZbRKDIVKu+ypZzHxCOwfs6xAjRuLb40MdOZS8d+
         2AVzRp2p6AycLOwbIgd9mTZ3a7diugth8A+0gx0IiWSkPZE7CD59avP0TSpDud6u6PWT
         YZG/UadsN9UV7hoGETzydTAo7+xYBOzZ77JiDFr/WOOGejnMPYhVFifIMZ66wu7WSbiJ
         v7lQ==
X-Gm-Message-State: AOAM530LueJ+1cVxKxAXPWZbv0pGj299KiReMrlR2vtaGWEM+1xXeXSS
        ktUvnE3eG/ZDgCdQQFMloiZ2eBIYWhOLdSfGB6qLkOUs7GCTnPVTK/Vm9W0PaKy/2BPB9Udecmq
        6FUEQLEfr+RDPZG4kc17C4sU=
X-Received: by 2002:a0c:b78c:: with SMTP id l12mr4413974qve.38.1601497053272;
        Wed, 30 Sep 2020 13:17:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ3TC8GL+vzyZ+qTkdpfJhop1qjyPMIEgoMqTXUpuiVjfkcAJXMiqXJAMYGyyIpkiq4xWXXQ==
X-Received: by 2002:a0c:b78c:: with SMTP id l12mr4413964qve.38.1601497053064;
        Wed, 30 Sep 2020 13:17:33 -0700 (PDT)
Received: from Whitewolf.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id 85sm3324528qkn.64.2020.09.30.13.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 13:17:32 -0700 (PDT)
Message-ID: <e347d9fbd20a778a5610b33e1dfb9966a14dfd8a.camel@redhat.com>
Subject: Re: [PATCH v3 0/2] Add support for F3A
From:   Lyude Paul <lyude@redhat.com>
Reply-To: lyude@redhat.com
To:     Vincent Huang <vincent.huang@tw.synaptics.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Date:   Wed, 30 Sep 2020 16:17:31 -0400
In-Reply-To: <20200930094147.635556-1-vincent.huang@tw.synaptics.com>
References: <20200930094147.635556-1-vincent.huang@tw.synaptics.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

For the whole series:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2020-09-30 at 17:41 +0800, Vincent Huang wrote:
> RMI4 F3A supports the touchpad GPIO function, it's designed to support
> more GPIOs and used on newer touchpads. The patches add support of
> touchpad buttons and rename f30_data to avoid confusion.
> 
> Changes in v2:
> - Combined patch 1 and 2 of v1 to fix bisectability.
> 
> Changes in v3:
> - Fix indentations pointed out by Lyude Paul.
> 
> Vincent Huang (2):
>   Input: synaptics-rmi4 - rename f30_data to gpio_data
>   Input: synaptics-rmi4 - add support for F3A
> 
>  drivers/hid/hid-rmi.c           |   2 +-
>  drivers/input/mouse/synaptics.c |   2 +-
>  drivers/input/rmi4/Kconfig      |   8 ++
>  drivers/input/rmi4/Makefile     |   1 +
>  drivers/input/rmi4/rmi_bus.c    |   3 +
>  drivers/input/rmi4/rmi_driver.h |   1 +
>  drivers/input/rmi4/rmi_f30.c    |  14 +-
>  drivers/input/rmi4/rmi_f3a.c    | 240 ++++++++++++++++++++++++++++++++
>  include/linux/rmi.h             |  11 +-
>  9 files changed, 268 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/input/rmi4/rmi_f3a.c
> 
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

