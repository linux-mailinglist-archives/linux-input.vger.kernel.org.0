Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBCA4DD1F8
	for <lists+linux-input@lfdr.de>; Fri, 18 Mar 2022 01:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbiCRAde (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Mar 2022 20:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbiCRAdd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Mar 2022 20:33:33 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22343292DA8;
        Thu, 17 Mar 2022 17:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        Subject:From:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=02hioLSoyIA1XtKWIrkxtX+6sNLC7Bf+ftpgABZAoDM=; b=gkT5DB0mhJguDC+nk9BK1jQxka
        BhLG4Yox2WvYZwqs0+ZOXgFyy6AkLgwX97/MLWb82kr53GnmR0ny4DOuyeDi+ljajPE9ii0FmrldB
        dE1EBd4TuMNWlsDbXoeDRnCyn3EduncG2+HdQDGiyg62+lLT2VPay0OdVg2PCHzCBRR5rCoY22ghW
        NkHDSZXixXCB5KYAN9aWaFC/G0oT0yXSkbbcTSGKg8vG0chS0/j9VWW64FLe/037U/A4RJruPs4hZ
        VH/H4nhfcaI+tAQZkUCtT3Qj3o82sMaSgmBJ+J53VAA3bi7znrv2PDy5lRjUSpQ3pBaXUJQTE6VP1
        t/KVhIvA==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nV0XK-007T6c-AG; Fri, 18 Mar 2022 00:32:10 +0000
Message-ID: <b9d9171d-1287-e5aa-46d2-2475817074ba@infradead.org>
Date:   Thu, 17 Mar 2022 17:32:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Dell.Client.Kernel@dell.com
Cc:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Stuart Hayes <stuart.w.hayes@gmail.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Perry Yuan <Perry.Yuan@dell.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: Dell laptop touchpad disabling?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi all,

I have a Dell Inspiron 15 5510 laptop. Of course, it has a touchpad
(which I think of as a nuisance pad).
I would like to be able to disable the touchpad easily.

Are there any best practices or suggestions for how to do this?
(I am using xfce4 as the desktop environment if that matters.)


Sometimes the touchpad is discovered as a PS/2 Generic Mouse on
the i8042 AUX port, and sometimes it is discovered as this
touchpad: "DELL0B24:00 04F3:3147 Touchpad" on some I2C device:
"i2c-DELL0B24:00". (The different discoveries might have something
to do with my kernel configuration/builds, but I don't know that
for sure.)

I have some very hackish scripts that I can run to toggle the
'inhibited' flag in sysfs (/sys/class/input/ for the I2C device or
or /sys/devices/platform/i8042/ for the i8042 AUX port device),
but that requires root (sudo), so that does not qualify as "easily"
IMO.

E.g.,
$ sudo toggle-aux-mouse
or
$ sudo toggle-i2c-touchpad

depending on which configuration the device is in.


Thanks for any advice etc.
-- 
~Randy
