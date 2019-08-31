Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87C10A4403
	for <lists+linux-input@lfdr.de>; Sat, 31 Aug 2019 12:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbfHaK1P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 31 Aug 2019 06:27:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55042 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726942AbfHaK1P (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 31 Aug 2019 06:27:15 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 07519750C0
        for <linux-input@vger.kernel.org>; Sat, 31 Aug 2019 10:27:15 +0000 (UTC)
Received: by mail-ed1-f69.google.com with SMTP id z25so5720333edm.3
        for <linux-input@vger.kernel.org>; Sat, 31 Aug 2019 03:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OahNrhHbSwNBM3L/g49f4L+NuQXQHgwHJOOx7peF2Y0=;
        b=ZEtjdGi129gxAf/rM79tnTTZ2SmgNjLmMqDdy+EH48QvCxg9qjRDT6ES1FSOn69m3e
         i7vt6rNw8N5Wvw0nmgoK9xnANIiLkRlv650w+V4+HSzd/bVoBijl2xBUIqo70Ye46Q55
         Imn42aU09Z9fpgE+Rm/ziRDHSJcMDyqZS6iqQdUmz1s23eqwTMQEWYaFkJU8tM8mDErJ
         4rTOPGo9XPbKSWGOLJhbcW+/H2+zNxWcRBMMV9RJxpdBWFYmbkG/AKOLRuF2y9eAsJQz
         n+7V0+7EQC373IDpZI2laup8Q7ltCDrwjqqm6FH7QB6Byo1m3HJVhnceyAtNheEMubEf
         hYcA==
X-Gm-Message-State: APjAAAU2QYXDQwq4cY6ujbaP7w50MbxRT3nHnrfCSnckIK+sg3ZN3pIs
        QxgA4gLFbzRei2XcpeQvd4QROC6Mz4yQD+KXr7p+BG4QkH3J3YsNfepDUPLh/KAbXZ0uaOmnSEI
        WCJifMJ2aMn4F0k8Vyyo1+cU=
X-Received: by 2002:a50:f285:: with SMTP id f5mr20209825edm.109.1567247233368;
        Sat, 31 Aug 2019 03:27:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqygIHPw4rv5YCjejOeqZ+vwxdXIhQ5vUTlnpEW9GUDUL3+6McB35F9HymDyk1fGdYc50apIVw==
X-Received: by 2002:a50:f285:: with SMTP id f5mr20209817edm.109.1567247233229;
        Sat, 31 Aug 2019 03:27:13 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id z6sm65490ejo.26.2019.08.31.03.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2019 03:27:12 -0700 (PDT)
Subject: Re: [PATCH v3 1/7] Input: Add event-codes for macro keys found on
 various keyboards
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <20190828124130.26752-1-hdegoede@redhat.com>
 <20190829175151.GB187474@dtor-ws>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c7957ff6-bae5-c577-7744-4daf7fc35600@redhat.com>
Date:   Sat, 31 Aug 2019 12:27:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829175151.GB187474@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 29-08-19 19:51, Dmitry Torokhov wrote:
> On Wed, Aug 28, 2019 at 02:41:24PM +0200, Hans de Goede wrote:

<snip>

>> This commit adds the following new KEY_ defines for this:
>>
>> KEY_MACRO1 - KEY_MACRO30. KEY_MACRO_RECORD_START/-STOP,
>> KEY_MACRO_PRESET_CYCLE, KEY_MACRO_PRESET1 - KEY_MACRO_PRESET3,
>> KEY_KBD_LCD_MENU1 - KEY_KBD_LCD_MENU5.
>>
>> The defines leave room for adding some more LCD-menu, preset or macro keys,
>> the maximum values above are based on the maximum values to support all
>> currently known internet, office and gaming keyboards.
>>
>> BugLink: https://github.com/libratbag/libratbag/issues/172
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thank you, does this mean that you are ok with merging this through the
hid tree as part of the rest of the series ?

Regards,

Hans
