Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E610660EA8E
	for <lists+linux-input@lfdr.de>; Wed, 26 Oct 2022 22:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234605AbiJZUuI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Oct 2022 16:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234604AbiJZUuH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Oct 2022 16:50:07 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC8651DA58;
        Wed, 26 Oct 2022 13:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1666817402; bh=vOFYLZfzisEKlTQN98kbPMj0id3+N70AzrG/XOCH0sU=;
        h=X-UI-Sender-Class:References:In-Reply-To:From:Date:Subject:To:Cc;
        b=DOgfRUW5uXUnwqyLbFbH4wmSuVhvMJlJaSr/3fdh6Auj+ibm81mKvbl2ZVzsHn5jF
         Iz3OJWbiq4vm2g8Td3N7Ct+V1bmkTcmNVQCrzV1WpFNuw/U4hIkEXl0CmGB7xnU2S8
         n3/l69dSk6JCxNxNde1xQpA6WPRh2fFVpP0brWWuz6IWywqk1gQwF93V2euQob8cwX
         uN4aKdz8R6ZclWNxXN7t7Tmcj32YgnojGhAuXXm3Wch2pAEGpWFmS86VCqsMfDJMW2
         5uTlFZROCr7vBuQGNFmO9UoS4ECzZUWOLi9/f0N5LXDLD4meeqM6Y8HWT3iiKeRiT1
         uT3i/R7l56+1Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mail-ej1-f51.google.com ([209.85.218.51]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MiJZE-1pK5QS1BYs-00fQU5; Wed, 26 Oct 2022 22:50:02 +0200
Received: by mail-ej1-f51.google.com with SMTP id bj12so24736555ejb.13;
        Wed, 26 Oct 2022 13:50:02 -0700 (PDT)
X-Gm-Message-State: ACrzQf1rmzYRx/lYW7R4EaniI2G22fzL6hplyuGdwczsqRkzt9KmqVqB
        pTXx9YpQulV4Zp6iB6kCXQvpqGEwo8pYnXYJVUI=
X-Google-Smtp-Source: AMsMyM5IwzoryT0nNmT4ZY4yOVW3i1UvlgRJlCAMqq+SaEPMFuG/xMvuWY8uQE2CNGNvf1X1uOTZRS8kB34z0UnsfBE=
X-Received: by 2002:a17:907:9707:b0:78d:45d1:487e with SMTP id
 jg7-20020a170907970700b0078d45d1487emr38451575ejc.566.1666817401892; Wed, 26
 Oct 2022 13:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <Y1AVDck5sQf8+QFX@rowland.harvard.edu> <CABfF9mPU52OXTGcsbatJCG4nbP4zaPN3iJnttMg+xRyGY6dUEQ@mail.gmail.com>
 <CAO-hwJJ7cF-4kd8Mi6bb5n-k5LuMrWbpdMqFs82y7iQOscr-7g@mail.gmail.com>
In-Reply-To: <CAO-hwJJ7cF-4kd8Mi6bb5n-k5LuMrWbpdMqFs82y7iQOscr-7g@mail.gmail.com>
From:   Andreas Bergmeier <abergmeier@gmx.net>
Date:   Wed, 26 Oct 2022 22:49:50 +0200
X-Gmail-Original-Message-ID: <CABfF9mNfU=swmpVXfVr7pYWs72jrd-HDY8+_NXyBDAKa4CWG5Q@mail.gmail.com>
Message-ID: <CABfF9mNfU=swmpVXfVr7pYWs72jrd-HDY8+_NXyBDAKa4CWG5Q@mail.gmail.com>
Subject: Re: Litra Glow on Linux
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Ghht1X8accgY5A+G+DqeLsFpVuyaosotF3IZ/OkEFgUIcMQF6pe
 DNPXJJ3j5nHAx5m6Ey/+0KBLDCxbfKB7CTsvf3Jz3YOAHRsossSh2PyZYP8URYkfQg/yuZq
 NcBGVMlpSrlVuC1An83tcqCVQv5PyB/pS55Hiw53peSrXQqvUg7vZlzBkOPZ/Q7ws+Pa0HO
 iOowW0zwVZ4yzbJoA7cHw==
UI-OutboundReport: notjunk:1;M01:P0:BsYo1Tnbxg8=;u814shRmhcUPwcY+d+5ItVOKbFl
 giampkEAMvAfFYtybXxGLutXTHfuQFrvTHWRBrvYVTXwjBan2VQSjw+RzvPql/1tyORgBsEHq
 2xHJmMjGPN/lf0aLPBqJmCbbNmF6qx0P8wosZLg6MoTB28/n8ovxcNqFv8Hc+18Oe4Nt8JlnT
 YEWP9TFDt9kMdPLrXOWdq0nRpHmEhW8J9utCogEkB2DDgplai5vH8hGnxeiHM0PIKQwHa6MCy
 lO59bA+qv1cfw2FkmTEAbzJVtmO/oOvc6V9oWUOia3BljrG8q6NLOyua30WyVRTitdRgXnAGU
 pm/TFY0EAe3d6MJgBXKPXEEAH9EJ6R+dJlNYOsnstkwfkmM8DCYkMN+smo9Jle+/W4VzvhLy2
 0lGJ7mf6Np2SO1jdj9HIb2GkgylTp653JK0C6rXRFiBIbS4Yoir6uu5t85SEFXRBxzKUEAFDP
 ouxHoA/e5gPLHz8JgeH7l1XNUhOwu8+k8Wx3oK0hVfs/yOnhILhkfSxVLAWvir/yrFJHgyyQd
 ayZ+C59Akl9Qt5NjEIEOppmv+v0+h4QkaXtSKOJS33CF7Mb1wLbY+YxD9jvl7DJgAxxTymZoH
 ECJNf8J/2VBkrv2yRxXIRKI1JA4YkrfIrATdgh3gRANvXhuAsXrLtGAqR3JDXu5CfnLbXn0Xr
 21fHP45gTa0ye0m0WGUUU1mfj7p6EMuyjBgaHtpsJQG6KYZR6b7QqkyQ/9dO8NqqV1T7jc4At
 ZSge3SwJXyAUU4mc02rleTOLqO6kUkMDuHyjZg4QqzL70/ZRbIzsKMUeQf7CmQ93JY3tsW/Wf
 szOry2jwanxn5fpVgszVyhH2BTqX/km9vTfY8snqM3t0SvPcGrzFuBNHRVEmBTJAv97uvmuo5
 B02ZuUWm3bwUVXc6Mm0cehZbOxjZ2dN/9HbUSdUb0bV+uFy5zhnF+tX53iloWnxFB/TIovR9F
 H5Qx/zCB4nSBkMSlvgkBrlkYp3M=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 25 Oct 2022 at 09:46, Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
> Depending on how the device presents itself, we might have to use
> hid-logitech-hidpp, not hid-lg FWIW.
Ah, indeed it seems to be a hidpp device.
I so far wrote code to interact with the device using hidraw and
hiddev. What are the implications of a hidpp device?
How is hidpp exposed to userspace?
From a search it seems like there are very few userspace programs that
handle hidpp on Linux.

> And to answer the question "how to map the device to input
> "primitives".", it all depends on how the device exports itself.
All information that I have gathered so far is on
https://github.com/abergmeier/litra_glow_linux.

The output of `hidpp-list-features /dev/hidraw0` is:
```
Logi Litra Glow (046d:c900) is a HID++ 4.2 device
Feature 0x01: [0x0001] Feature set
Feature 0x02: [0x0003] Device FW version
Feature 0x03: [0x0005] Device name
Feature 0x04: [0x1990] ?
Feature 0x05: [0x1eb0] ? (hidden)
Feature 0x06: [0x00c2] DFUcontrol 3 (hidden)
```
Is it possible that Feature 0x04 is the protocol for sending changes
to the device?
All the payload that is sent to the device has a 0x04 directly in
front of the instructions.
As an example, for turning the light on you send raw bytes: [0x11,
0xff, 0x04, 0x10, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
0x10 seems to indicate setting the on state.

> > To recap there are 5 hardware buttons and 3 states:
> > - State: "Color temperature in range [u, x]" Button: up
> > - State: "Color temperature in range [u, x]" Button: down
> > - State/Button On/Off
> > - State "Brightness in range [y, z]" Button: up
> > - State "Brightness in range [y, z]" Button: down
>
> FWIW, you should be able to use hid-recorder[0] (as root) to record
> traces of the events, and to parse them on the fly. Also, if you
> provide us the output, we can replay the traces locally as if we
> virtually plugged in the device.

See the GitHub repo - there are already initial recordings.

> FWIW, if the first byte you have to send to control the LED is 0x10,
> 0x11 or 0x12 then this is a HID++ device that needs to go in
> hid-logitech-hidpp and a lot of groundwork is already done in the
> kernel for it.
I am trying to get up to speed with hidpp - but I am not there yet.
Do you have any hints on what code to read specifically since
logitech-hidpp is a bit long...

Thanks for the feedback so far
