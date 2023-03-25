Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 528656C910B
	for <lists+linux-input@lfdr.de>; Sat, 25 Mar 2023 22:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbjCYVue (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 25 Mar 2023 17:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbjCYVud (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 25 Mar 2023 17:50:33 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF2EBB85;
        Sat, 25 Mar 2023 14:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1679780993; i=w_armin@gmx.de;
        bh=KcyJxrS5XQcTlT4pcvTitvCAa0GoEe27HuW9IhP/e0s=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=XbRiFUimb8meSf0lZy/gKjfoleF/QserJSUgG/t4oX6yc4qv737mKFQOm19z+eD4V
         i2ZWwTwa60VXd0huts3OfEaw1PdKNrG38v3Mc1bLl5DAEQcjGvEuhSHwCWctoeqRt6
         NAZ1PYe8gHScFSopzg4IgfVEBCrj//PId2O5sXHAJtOHQ2ha1+w61u8SrtvO5EgxUx
         E/yd1R9HKXl8skRzOlEeQwAOKFdY1IqmQbof7DTjkOX1kLldx5mpXxSSUXtM9XFiDt
         /c9lzoLY/ZuxivNdeJm3GgfsT3970qs8r7eaOxSUYB6vzOXBbDkMr/JgIZzLJcE0XA
         eXiVE1+JfRl/Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([141.30.226.119]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMofc-1pwcC531Do-00Ingu; Sat, 25
 Mar 2023 22:49:53 +0100
Subject: Re: [PATCH v2 2/2] platform/x86: Add driver for Yoga Tablet Mode
 switch
To:     Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, Gergo Koteles <soyer@irl.hu>,
        Ike Panhc <ike.pan@canonical.com>, linux-input@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
References: <20230323025200.5462-1-kallmeyeras@gmail.com>
 <20230323025200.5462-3-kallmeyeras@gmail.com>
 <7584e398-202a-dcee-ef5d-47a3989b06ab@gmx.de>
 <CAG4kvq9apmScR2Y8VO4Xb=4QPVw3XE19m2fR+L_xgER2ka+BvQ@mail.gmail.com>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <c0a74480-52f9-3e4d-f4b5-5c39611e8965@gmx.de>
Date:   Sat, 25 Mar 2023 22:49:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAG4kvq9apmScR2Y8VO4Xb=4QPVw3XE19m2fR+L_xgER2ka+BvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:IycHZLuYvytuQdslRSPjOxXysaVzCs7lqoQpRB8z7S+OM/ixinn
 5EtDHuRUKhmAO6rZ8k7LS0uGKo5D75LA5U9XMXCWjsQ2hgUmbtnun4dMrkKNXGoa3fR7HeI
 oSKRV4zHneErDaHK9R4WotKDtVBzu2Lynl4ars6MI4/f1ycsiOFf3/O5LfwgQKETkPIM5Pt
 pR3faiETiuk7ldpT49zBg==
UI-OutboundReport: notjunk:1;M01:P0:l2fCcChcLPs=;XJnvB12znBJ3kR9PFUw4gpqz8m+
 UME6t7RFd5lUTxfHxhRh/MQhGBiNVttdwDvd3NpMaX7IfdWzIVyDL5guwNFc/sdYm+1nIjq3s
 0Ul9szzuqrVPzbCeMtv/CFi8D8YRtDeH7THRhdhix1cBQgXLGWdwhtnIps9nFW0WninSUHKXb
 yhGLbQFt/qmoX37cK5UE3BmpL5941fzW0cS6K2uf/YuxQI4qihzrzJYigvwQkNpGijIpSTVAQ
 SiH7+qdhKX3tdU0sVFhOW6MUN386v9XH9bTQJ2zBSIJSX/0E+d8i5ZaBZtZTsQC52aI5yScdq
 KyKOUybSoUQXj/xgMSrp5yHQDTL16b9nRVEcGS3uKnvCitNC07X5YioudWNUC8Gaz7OGIxDSn
 AC8ERAefUGMCYK4CxuXFF8MbDhooPORO42yKJYcga/zPfb7jml70AeNYKLGTRY4HetZukv+fH
 rXIQyeAo7e0+xmXADDJSsFdaI2o7QgOGCHdwT+UOiZ+Q441nFnWgIWje074EVJYQYJ1P5pECo
 A6cRPwTmPJMYOZxqAJqXDotd2ltAzQUWYqce/fVeuoypdcGrH62CKY0byTouhZuXZw47lN4+H
 4T0NdmaX/Puu+vQsEBd3NxLNiHkjPyYxeiXxpn7HaG6+TRibtjHvPTmr8b1FUj5p6xK8MrVEl
 mvPY6JoOaIzBYQEsnZTA6MSzVDpubtiDLUYsUPcn0N+2xjX2DSBC9C15HLSA+oLMocdi4rLCS
 Su4RLCRRopQFDqIMnwD7jN15rjVZDcFJQobmUtr0Ug+hohZ0AW9+OeyvlBJUemgYND/g/QZzd
 YR+CR+K0OK6bnucEqhkwRc3XfJKtCkonx6oQKwGvYyonvB3/hG/nhGNVg5xLSu+Uz3QixbAlE
 Yw241eMq5b+GH4jzA2B9Bh4w1GwToN51x75FDDBZ/4EaSk8DGVlvibqrKIngqMwr6NEK2KL0p
 1GEnthDfOL+LeMHb3O9+0cH1sWY=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am 25.03.23 um 16:16 schrieb Andrew Kallmeyer:

> On Sat, Mar 25, 2023 at 12:10=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wro=
te:
>> Hi,
>>
>> is it really necessary to allow userspace to read/write ec_trigger? The=
 ACPI device
>> used for triggering the EC is only initialized during probing, so chang=
ing the value
>> of ec_trigger will make no difference in such cases.
>>
>> Maybe you could change module_param(ec_trigger, bool, 0644) to module_p=
aram(ec_trigger, bool, 0)?
>>
>> Armin Wolf
> Great point, this is actually a regression from Gergo's original patch
> that I didn't realize I caused. I believe the intention was that if
> the quirk detection code doesn't have full coverage users can set the
> parameter themselves. In Gergo's code it used the acpi_device from
> ideapad-laptop.c which is always loaded if it exists. Now I only load
> it if ec_trigger is true at probe time, I think I should update it to
> load the acpi device always if it exists so that the user can set this
> parameter at any time. I suppose I would just remove the if
> (ec_trigger) (and the debug print) in the probe code when I load it.
>
> That is, unless you think it is best to just patch in more models to
> the quirk detection later and not provide a parameter. Barnab=C3=A1s
> actually suggested removing the ec_trigger flag completely because
> right now the code isn't relying on it, but I think that is a bug.

I think it is best to still provide this module param for people who need
it, but only allow enabling it when loading the module. This way userspace
should not be able to read/write ec_trigger after the module has been load=
ed.

Because of this, i believe the ACPI device should only be initialized when
the DMI table says its necessary or ec_trigger was set. So the current sol=
ution
is fine for me, except for ec_trigger being accessible to userspace after
the module was loaded.

Armin Wolf

