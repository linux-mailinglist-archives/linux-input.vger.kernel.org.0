Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAA57441939
	for <lists+linux-input@lfdr.de>; Mon,  1 Nov 2021 10:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232908AbhKAKAH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Nov 2021 06:00:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46413 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232929AbhKAJ7R (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Nov 2021 05:59:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635760604;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vnNLP3pxCj5kK+Y7vBpKll8NWXd7vahWcRAymdcHOXU=;
        b=XMxIYR6Ct4LAlKOU6HWX70OX7h6tOys4BaqEVdiM8JApgs6qvrpxFTi5SpPIs/QnEH0rUz
        sE3m/CRr0ZLWd9I/6XCuX5xNomIW7nwM+Vns8qyQO7ozIOWYuq9dV2ln9HR1ghEgpWBf7B
        oSTqMFEdOqA/UDYzpNI3tz32XOO79zo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-a4QEp2SkNpWOd00-gsf64g-1; Mon, 01 Nov 2021 05:56:43 -0400
X-MC-Unique: a4QEp2SkNpWOd00-gsf64g-1
Received: by mail-ed1-f69.google.com with SMTP id r25-20020a05640216d900b003dca3501ab4so14987597edx.15
        for <linux-input@vger.kernel.org>; Mon, 01 Nov 2021 02:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vnNLP3pxCj5kK+Y7vBpKll8NWXd7vahWcRAymdcHOXU=;
        b=TY4N/NjWW2NTsYJJ1MAdu+AuFl91IwmnNhx95ZR0Gb3xwQ1IZgpicI0Ar6gPj7+IvD
         zsBw0ZMJfMTlDQnjMaW87zpv/TMwDnaBLbIgHaPgM9RhjHhsv0tPbgthumZxg6gbxYOR
         s7k0ySbMQUpr0fCfTOkIwdoSCI0TVtkGuZWuyUP/To3Y3Ua1mH8hyoS6PlyZ/FX97GHT
         gEHisojL96sJnpPH53Met4Xb7n6oXnaRa/9OdDz4iU2t92BcpmSN8e7EdHd6dIrEBJZW
         69tGgg+vnKB2eAPY0J1UUDfvoOKKbj+eqPbTvlaGkPgTXaT2EhYhg1DEEC8eI1eDiWyG
         23eA==
X-Gm-Message-State: AOAM5315DB0m5/vtA9BvTioqqxiiz3cahH3S6WwjuMYHCW4/a6v2ClkV
        1GvFz7Xiuhwesm0bAhfGmfxqNJrsVPn0YGWrCWO/JAbT9QsQoWdo/zz0ScQwTfUCBnhoKBvOGf8
        F1/EWWiwS9bAiV1yYRZ/smhk=
X-Received: by 2002:a17:907:72c3:: with SMTP id du3mr34940713ejc.536.1635760601915;
        Mon, 01 Nov 2021 02:56:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDvKiU7RqegUNMLj+l6RYZc7y2j4L+5bcqrSsjwNjl0uODitZefSFLpVVKu1zw5CeLeXrwIA==
X-Received: by 2002:a17:907:72c3:: with SMTP id du3mr34940693ejc.536.1635760601753;
        Mon, 01 Nov 2021 02:56:41 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id bm1sm6701834ejb.38.2021.11.01.02.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 02:56:40 -0700 (PDT)
Message-ID: <883db585-c9bb-5255-4ddd-f093616af1a1@redhat.com>
Date:   Mon, 1 Nov 2021 10:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/6] MODULE_DEVICE_TABLE() support for the ISHTP bus
Content-Language: en-US
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        platform-driver-x86@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20211029152901.297939-1-linux@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211029152901.297939-1-linux@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/29/21 17:28, Thomas Weißschuh wrote:
> Currently as soon as any ISHTP device appears all available ISHTP device
> drivers are loaded automatically.
> This series extends the MODULE_DEVICE_TABLE() functionality to properly handle
> the ishtp bus and switches the drivers over to use it.
> 
> Patch 1 adds the infrastructure to handle ishtp devices via MODULE_DEVICE_TABLE()
> Patch 2 replaces some inlined constants with ones now defined by mod_devicetable.h
> Patches 3-6 migrate all ishtp drivers to MODULE_DEVICE_TABLE()
> 
> Note: This patchset is based on the pdx86/for-next tree because that contains
> one of the drivers that is not yet in the other trees.

Since most of the changes here are under drivers/hid and since the latter
patches depend on 1/6, I believe it would be best to merge the entire series
through the HID tree, here is my ack for this:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> 
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Rushikesh S Kadam <rushikesh.s.kadam@intel.com>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Cc: Benson Leung <bleung@chromium.org>
> 
> Cc: platform-driver-x86@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
> 
> Thomas Weißschuh (6):
>   HID: intel-ish-hid: add support for MODULE_DEVICE_TABLE()
>   HID: intel-ish-hid: use constants for modaliases
>   HID: intel-ish-hid: fw-loader: only load for matching devices
>   HID: intel-ish-hid: hid-client: only load for matching devices
>   platform/chrome: chros_ec_ishtp: only load for matching devices
>   platform/x86: isthp_eclite: only load for matching devices
> 
>  drivers/hid/intel-ish-hid/ishtp-fw-loader.c  |  7 +++++-
>  drivers/hid/intel-ish-hid/ishtp-hid-client.c |  7 +++++-
>  drivers/hid/intel-ish-hid/ishtp/bus.c        |  4 ++--
>  drivers/platform/chrome/cros_ec_ishtp.c      |  7 +++++-
>  drivers/platform/x86/intel/ishtp_eclite.c    |  7 +++++-
>  include/linux/mod_devicetable.h              | 13 +++++++++++
>  scripts/mod/devicetable-offsets.c            |  3 +++
>  scripts/mod/file2alias.c                     | 24 ++++++++++++++++++++
>  8 files changed, 66 insertions(+), 6 deletions(-)
> 
> 
> base-commit: 85303db36b6e170917a7bc6aae4898c31a5272a0
> 

