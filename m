Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4988F14A7FE
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2020 17:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgA0QZd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jan 2020 11:25:33 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33646 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgA0QZd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jan 2020 11:25:33 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 4B80F29146A
Subject: Re: [PATCH v3] dt-bindings: mfd: Convert ChromeOS EC bindings to
 json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     Ikjoon Jang <ikjn@chromium.org>, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org
References: <20200114021934.178057-1-ikjn@chromium.org>
 <20200121074727.35893-1-ikjn@chromium.org>
 <6739cc32-9beb-ac0a-f500-db2d70bb8e22@collabora.com>
 <20200127161206.GB30843@bogus>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <ef653218-4a59-73e1-186e-9b62b8ed6dae@collabora.com>
Date:   Mon, 27 Jan 2020 17:25:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200127161206.GB30843@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rob,

On 27/1/20 17:12, Rob Herring wrote:
> On Mon, Jan 27, 2020 at 04:57:13PM +0100, Enric Balletbo i Serra wrote:
>> Hi Ikjoon,
>>
>> On 21/1/20 8:47, Ikjoon Jang wrote:
>>> Convert the ChromeOS EC bindings to json-schema.
>>>
>>> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
>>> ---
>>> v3: node name changed in rpmsg example
>>> v2: cleanup description, fix typos, remove LPC, add add RPMSG example
>>> ---
>>>  .../devicetree/bindings/mfd/cros-ec.txt       |  76 ------------
>>>  .../devicetree/bindings/mfd/cros-ec.yaml      | 111 ++++++++++++++++++
>>>  2 files changed, 111 insertions(+), 76 deletions(-)
>>>  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
>>>  create mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.yaml
>>>
>>
>> Still in mfd directory, this is not a MFD driver, please move to chrome/cros-ec.yaml
> 
> Please don't. Looks to me like the chrome EC has multiple functions and 
> is a device.
> 

This binding is part of the Chrome EC core and we explicitly moved all this out
from mfd subsytem in the past because wasn't really fit as mfd driver.

We still have one device driver (cros_ec_dev) in mfd, this is the one that
instantiates all the subdevices but the above binding is not related to this
one. All the core/bus part is in platform/chrome, looks to me more coherent have
the binding accordingly.

Anyway I'll let you the final decision, nothing that worries me too much.

Thanks,
 Enric

> Bindings directories are often 1:1 with kernel driver directories, but 
> not always.
> 
> Rob
> 
