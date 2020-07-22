Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 839E9229FBC
	for <lists+linux-input@lfdr.de>; Wed, 22 Jul 2020 21:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgGVTAa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Jul 2020 15:00:30 -0400
Received: from us-smtp-delivery-172.mimecast.com ([63.128.21.172]:34814 "EHLO
        us-smtp-delivery-172.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726157AbgGVTAa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jul 2020 15:00:30 -0400
X-Greylist: delayed 305 seconds by postgrey-1.27 at vger.kernel.org; Wed, 22 Jul 2020 15:00:29 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valvesoftware.com;
        s=mc20150811; t=1595444428;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=66bSVg3OneKpdE2Dy9Qgc9ggin87cXYIRLiO43in0IU=;
        b=HrhUjZjByRTVk/QMz7fWHF33mpQaqaeQKELIAwDsYP5pC22IN3HSpcMU269KB/VzyI7Kxs
        ofTYhk/HaPHKUQq0KmsSMnVCJoeXCGa/W0Lsgz5prIg6q6HP4W8vqhaoWSgNGaMLVZym/O
        FO3fHxea/c+0i6w8Gid0RkvJ2/uJKO8=
Received: from smtp-01-blv1.valvesoftware.com (smtp01.valvesoftware.com
 [208.64.203.181]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-1ZIC_m4XMTGYarcTWB4G5g-1; Wed, 22 Jul 2020 14:54:16 -0400
X-MC-Unique: 1ZIC_m4XMTGYarcTWB4G5g-1
Received: from [172.16.1.107] (helo=antispam.valve.org)
        by smtp-01-blv1.valvesoftware.com with esmtp (Exim 4.86_2)
        (envelope-from <pgriffais@valvesoftware.com>)
        id 1jyJsd-0009Vc-PO
        for linux-input@vger.kernel.org; Wed, 22 Jul 2020 11:54:15 -0700
Received: from antispam.valve.org (127.0.0.1) id h325le0171sl for <linux-input@vger.kernel.org>; Wed, 22 Jul 2020 11:54:15 -0700 (envelope-from <pgriffais@valvesoftware.com>)
Received: from mail1.valvemail.org ([172.16.144.22])
        by antispam.valve.org ([172.16.1.107]) (SonicWALL 9.0.5.2081 )
        with ESMTP id o202007221854150003466-5; Wed, 22 Jul 2020 11:54:15 -0700
Received: from [172.16.36.148] (172.16.36.148) by mail1.valvemail.org
 (172.16.144.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 22 Jul
 2020 11:54:15 -0700
Subject: Re: [PATCH v11 00/11] HID: nintendo
To:     Daniel Ogorchock <djogorchock@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
CC:     Roderick Colenbrander <thunderbird2k@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Billy Laws <blaws05@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Siarhei Vishniakou <svv@google.com>, <s.jegen@gmail.com>,
        Carl Mueller <carmueller@gmail.com>
References: <20200317032928.546172-1-djogorchock@gmail.com>
 <64ed771ebdd6c47c11a94f4e0ae365c6106b93f6.camel@hadess.net>
 <CAEc3jaACUvyrP=9=JZeUZEC16zDJ2NByJzaPHVO24024jwKJoA@mail.gmail.com>
 <59a550594ac3824532a667c668bf1dcb80747599.camel@hadess.net>
 <CAEc3jaDsSmCB0-AQDrh4_Cw3WjAavfXSy6G_A+bEtBF0U5ydkQ@mail.gmail.com>
 <703dfd7eeeb0839a34f8668c3a0d79c1ffd3ed59.camel@hadess.net>
 <CAEVj2tnXNF0BCSdH46DmNRtxPRO7oHkjdmvJuCmiRz4t4pFWuA@mail.gmail.com>
From:   "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
Message-ID: <292d45aa-cd32-3348-ce32-965281a52b20@valvesoftware.com>
Date:   Wed, 22 Jul 2020 11:54:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEVj2tnXNF0BCSdH46DmNRtxPRO7oHkjdmvJuCmiRz4t4pFWuA@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: mail1.valvemail.org (172.16.144.22) To mail1.valvemail.org
 (172.16.144.22)
X-EXCLAIMER-MD-CONFIG: fe5cb8ea-1338-4c54-81e0-ad323678e037
X-Mlf-CnxnMgmt-Allow: 172.16.144.22
X-Mlf-Version: 9.0.5.2081
X-Mlf-License: BSVKCAP__
X-Mlf-UniqueId: o202007221854150003466
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: valvesoftware.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Daniel,

Sorry for hijacking this branch of the thread (it's the last one that=20
survived my inbox) - it seems like merging this driver as-is would break=20
Steam, according to user reports.

Is there any mechanism built into this hid_nintendo patch series to duck=20
out of the way if userland directly opens the underlying hidraw device?=20
That's what hid_steam does to coexist peacefully with userspace drivers=20
(Steam being one of them, but not the only one).

Thanks,
  - Pierre-Loup

On 5/22/20 12:11 PM, Daniel Ogorchock wrote:
> Hi Bastien,
>=20
> Apologies for the late reply. This thread sneaked past me somehow. If
> we want to handle clone controllers with partial protocol
> implementations, is it preferable to present them identically to
> userspace, with non-existent functionality being no-ops? Or would it
> be better to just not create the interfaces for missing functionality
> (e.g. not create the led_classdevs for controllers without LEDs)? I
> assume the latter makes more sense, since it doesn't lie to userspace.
> Though it could potentially make the driver code messier.
>=20
> Thanks,
> Daniel
>=20
> On Mon, Apr 27, 2020 at 3:56 AM Bastien Nocera <hadess@hadess.net> wrote:
>>
>> On Sun, 2020-04-26 at 15:31 -0700, Roderick Colenbrander wrote:
>>> On Sun, Apr 26, 2020 at 2:14 PM Bastien Nocera <hadess@hadess.net>
>>> wrote:
>>>> On Sun, 2020-04-26 at 13:42 -0700, Roderick Colenbrander wrote:
>>>> <snip>
>>>>> I really wonder how a device like this should be handled. It
>>>>> looks
>>>>> like the device can also handle a bunch of other classic Nintendo
>>>>> controllers.
>>>>>
>>>>> Is there anyway of detection this adapter? It feels nasty to have
>>>>> to
>>>>> hack in quirks for this device...
>>>>
>>>> The end game isn't very different from how we handle XBox 360, or
>>>> PS3/PS4 "clone" devices.
>>>>
>>>> Those devices (the adapters) work on the actual Nintendo Switch
>>>> hardware, so should probably work with the driver that handles the
>>>> same
>>>> type of hardware on Linux.
>>>>
>>>
>>> (resend in plain text)
>>>
>>> I agree it probably makes sense to handle in this driver. I'm worried
>>> about the application level implications. We have been doing a lot of
>>> work e.g. on Android to try to make gamepads consistent. It is weird
>>> to have a "Switch controller" with different features as applications
>>> make assumptions and don't expect there to be multiple versions of a
>>> particular controller. Any button mapping files would potentially be
>>> wrong for those too, certain features are not there (e.g. no sensors
>>> or no lights or rumble) or if they are the behaviour is different
>>> (e.g. HD rumble vs a classic rumble motor).
>>>
>>> Ideally we would do some kind of "fixup" to change the device name
>>> and
>>> or replace the device ids to at least separate them.
>>
>> All those would be detectable at runtime. I'm not sure that it's ever a
>> good idea to presume that a particular VID/PID combination will have,
>> say, rumble and LEDs available when the driver can answer those
>> questions.
>>
>> For example, I'm not sure that those controllers have either features
>> (though I'm not certain they identify as Switch Pro controllers, but
>> for the sake of argument):
>> https://store.nintendo.com/super-nintendo-entertainment-system-controlle=
r.html
>> https://store.nintendo.com/nintendo-entertainment-system-controllers.htm=
l
>>
>> Cheers
>>
>=20
>=20

