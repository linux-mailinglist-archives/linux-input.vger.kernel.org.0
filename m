Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3EC320A80
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 14:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbhBUNSq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Feb 2021 08:18:46 -0500
Received: from ganymed.uberspace.de ([185.26.156.242]:35794 "EHLO
        ganymed.uberspace.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhBUNSp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Feb 2021 08:18:45 -0500
Received: (qmail 25821 invoked from network); 21 Feb 2021 13:17:53 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
  by ganymed.uberspace.de with SMTP; 21 Feb 2021 13:17:53 -0000
Subject: Re: Support for X1 tablet keyboard (was Re: [PATCH] platform/x86:
 thinkpad_acpi: handle HKEY 0x4012, 0x4013 events)
To:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <mpearson@lenovo.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>
Cc:     linux-input <linux-input@vger.kernel.org>
References: <53abdd94-8df4-cc1c-84e9-221face6b07c@a-kobel.de>
 <9d133a27-751a-a436-d255-3dd4a7d411d8@redhat.com>
 <38cb8265-1e30-d547-9e12-b4ae290be737@a-kobel.de>
 <be3f6a0f-281f-975f-70c2-b167adb5547c@redhat.com>
 <64a4f249-f90b-c6b2-887f-55a016d93c65@a-kobel.de>
 <29961a1a-a66a-e732-ff7c-c7f2da52a83d@redhat.com>
From:   Alexander Kobel <a-kobel@a-kobel.de>
Message-ID: <b1392cd8-eefc-4fff-d327-5159714ba304@a-kobel.de>
Date:   Sun, 21 Feb 2021 14:17:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <29961a1a-a66a-e732-ff7c-c7f2da52a83d@redhat.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms000101040906070007060602"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms000101040906070007060602
Content-Type: multipart/mixed;
 boundary="------------4023B6BA6F6E2CE1115A0AC0"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4023B6BA6F6E2CE1115A0AC0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

finally I got to investigate that patch. Thanks for your draft and explan=
ations!

On 2/12/21 12:42 AM, Hans de Goede wrote:
> Hi,
>=20
> On 2/9/21 4:16 PM, Alexander Kobel wrote:
>> Hi,
>>
>> On 2/8/21 11:17 AM, Hans de Goede wrote:
>>> On 2/7/21 6:55 PM, Alexander Kobel wrote:
>>>> <snip>
>>>> I'll go off and try to improve.
>>>
>>> So Nitin has been kind enough to provide us with some docs for this,
>>> please see me reply to Nitin's email and lets continue this part of t=
his mail
>>> thread there.
>>
>> Right. I have the other patch ready, thanks to your great help. I'm
>> waiting for Nitin's okay whether / how much info I can copy from the
>> reference sheet to source code comments. Once I have that confirmation=
,
>> I will post the revised patch.
>>
>>> <snip>
>>>
>>>> Finally, I mentioned some open ends already on a post to ibm-acpi-de=
vel
>>>> at https://sourceforge.net/p/ibm-acpi/mailman/message/37200082/; thi=
s
>>>> very question is among them.
>>>> I will start tackling the SW_TABLET_MODE event issue first, but if M=
ark
>>>> and Nitin can already hint about the keyboard shortcuts, it'd be hig=
hly
>>>> appreciated.
>>>
>>> I think I might be able to help there, a couple of months ago I bough=
t
>>> a second-hand thinkpad-10 tablet which also has a USB attached keyboa=
rd.
>>>
>>> In hindsight I guess I could have asked Mark and Nitin for some more =
info,
>>> but I went on autopilot and just ran hexdump -C on the /dev/hidraw no=
de
>>> to see which events all the keys send.
>>>
>>> And I fired up an usb-sniffer under Windows to figure out the audio-l=
eds,
>>> since I'm used to just figure these things out without help from the =
vendor :)
>>
>> Yeah, why take the boring route if you know how to do all the work on
>> your own... ;-)
>>
>>> See the recent commits here for my work on this:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/lo=
g/drivers/hid/hid-lenovo.c
>>
>> Thanks, very helpful.
>>
>>> So on the ibm-acpi list message you said that the kbd sends the follo=
wing:
>>>
>>> type 4 (EV_MSC), code 4 (MSC_SCAN), value c0001
>>> type 1 (EV_KEY), code 240 (KEY_UNKNOWN), value 1
>>>
>>> For the Fn-keys, does it send the same MSC_SCAN code for *all* the
>>> non-working Fn-keys ?
>>
>> Correct. And I can confirm that /dev/hidraw1 lets me distinguish betwe=
en
>> the keys.
>>
>>> If so then it seems that this is very much like the thinkpad 10 kbd d=
ock
>>> which also does this, see the lenovo_input_mapping_tp10_ultrabook_kbd=
()
>>> function in drivers/hid/hid-lenovo.c .
>>>
>>> If I have that right, then I think we should be able to get the
>>> Fn keys to work without too much trouble. You could try hacking up
>>> drivers/hid/hid-lenovo.c a bit:
>>
>> (Not yet there, but will investigate.)
>>
>>> 1. Add an entry to the lenovo_devices array like this:
>>>
>>> 	/*
>>> 	 * Note bind to the HID_GROUP_GENERIC group, so that we only bind to=
 the keyboard part,
>>> 	 * while letting hid-multitouch.c handle the touchpad and trackpoint=
=2E
>>> 	 */
>>>         { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>>>                      USB_VENDOR_ID_LENOVO,
>>>                      USB_DEVICE_ID_LENOVO_X1_TAB),
>>>
>>> 2. Add the following entry to the switch-case in lenovo_input_mapping=
() :
>>>
>>>         case USB_DEVICE_ID_LENOVO_X1_TAB:
>>>                 return lenovo_input_mapping_tp10_ultrabook_kbd(hdev, =
hi, field,
>>>                                                                usage,=
 bit, max);
>>>
>>> And then build hid-lenovo.c and modprobe it.
>>>
>>> After the modprobe to:
>>>
>>> ls -l /sys/bus/hid/devices/0003:17EF:60A3.*/driver
>>>
>>> This should show 2 devices (I guess) with one being bound to hid-leno=
vo
>>> and 1 being bound to hid-multitouch.
>>
>> So far (without patching hid-lenovo), 2 bound to hid-generic and 1 to
>> hid-multitouch.
>=20
> Ok, so it seems that they kept the thinkpad 10 kbd bits (mostly) with
> 1 keyboard interface using the usb boot kbd interface (so that it will
> also work inside the BIOS) and a second interface for multimedia-keys +=

> the mouse emulation of the thinkpad 10 touchpad, those are interfaces
> 1 and 2, except that they removed the mouse emulation as they added a
> new proper multi-touch capable touchpad as interface 3; and that one
> also handles the pointing stick I believe.
>=20
> So yes 2 bound to hid-generic, 1 bound to hid-multitouch seems to be
> correct.

Right, that's what I observe.

>>> If this works some of your Fn + F# keys will now hopefully start doin=
g
>>> something, you can play around with modifying lenovo_input_mapping_tp=
10_ultrabook_kbd
>>> to make it do the right thing for your kbd.
>>> z
>>> ###
>>>
>>> About LED support, just enabling the LED support bits for the
>>> USB_DEVICE_ID_LENOVO_TP10UBKBD handling for now might work fine,
>>> but there is a tiny chance that sending the wrong command somehow put=
s
>>> the kbd in firmware update mode, I had that happen once with a Logite=
ch
>>> kbd which did not seem to have any kind of handshake / passcode to av=
oid
>>> accidental fw updates (*).
>>>
>>> If you can give me a dump of the hid-descriptors for your keyboard,
>>> then I can check if that the LEDs might work the same way too (or not=
).
>>>
>>> The easiest way to get a dump is to run the following command as root=
:
>>>
>>> cat /sys/kernel/debug/hid/0003:17EF:60A3.*/rdesc > rdesc
>>>
>>> And then attach rdesc to your next email.
>>
>> Please find this one attached already now.
>> In case it helps, the * expands to 0057 0058 0059 on my system.
>=20
> Ok, so there still is an output-report number 9 on the second interface=
,
> which probably still controls the LEDS but its descriptors are subtly
> different. Although different in a good way I guess because the thinkpa=
d
> 10 dock descriptor describes the 2 bytes in the output report as being
> in the range of 0-1 which is not how they are actually used.
>=20
> So I think that the code for the Thinkpad 10 ultrabook keyboard as
> Lenovo calls it, should also work on the X1 tablet thin keyboard.

Mostly, modulo some key mappings, as expected.

The good:

LEDs are working exactly as expected with your patch, with the appropriat=
e triggers automatically active. Perfect!


The bad:

I could adjust some of the key mappings for the X1 Tablet 2nd keyboard. W=
hat I couldn't do is to get Fn+F10, Fn+F11, Fn+F12 and Fn+PrtSc to work.
Following the logic of /dev/hidraw1 capture (attached), those should be o=
n usage_index 16 to 19. But apparently those are on a different usage pag=
e or something like that? Unfortunately, my RTFM skills didn't really hel=
p with figuring out how that's supposed to work.
(Is looking at the bit indices in /dev/hidraw traces how you figure out t=
hose mappings? If there's a better way, I'm eager to be told...)

Similarly - I assume - Fn+S should emit SysRq according to https://downlo=
ad.lenovo.com/pccbbs/mobiles_pdf/x1_tablet_gen_2_ug_en.pdf, page 51. This=
 is not on the "consumer control" device, but the usual keyboard, so /dev=
/hidraw0. Again, couldn't get much further than producing a capture. But =
I cannot make sense of this one, because way more bits are set, so I cann=
ot extrapolate from your code.


The ugly:

Fn+4 ("sleep") triggers the appropriate ACPI event button/sleep and emits=
 something on /dev/hidraw0, too, but *only once*. After resuming, no reac=
tion at all (neither on ACPI nor hidraw) until I unload and reload the hi=
d_lenovo module.

Finally, keyboard backlight is handled in firmware, apparently; Fn+Space =
is visible on /dev/hidraw1 (see attached capture), but it toggles the bac=
klight levels without any userspace code involved, as far as I can see.
Also, the keyboard backlight doesn't create an entry in /sys/class/backli=
ght or the like, so neither read nor write access. Out-of-the-box, at lea=
st. But I'm not even sure if this is possible in Windows.


Bottom line: this is mostly usable already, modulo the adjustments for th=
e different keys. I'd like to make F10 to F12 work before it hits testing=
; everything else is icing on the cake, I suppose. Do you have an hint fo=
r me how I can approach that?

Also, I'd make sure that this is about the "ThinkPad X1 Tablet Thin Keybo=
ard **Gen 2**". The consumer functions are different for the **Gen 1** ke=
yboard, so I would also adjust the function names. I do have an old Gen 1=
 keyboard lying around, but unfortunately it's either broken (it lights u=
p shortly after attaching in Windows, but doesn't report keypresses at al=
l, and pretends to be completely dead in Linux), or it's incompatible wit=
h my X1 Tablet 2nd Gen. So I cannot test how your patch might impact the =
Gen1, too... :-/


> I've prepared a set of patches which enable the tp10ubkbd code on
> the X1 tablet thin keyboard. But beware as mentioned before there is a
> tiny chance that sending the wrong command somehow puts the kbd in
> firmware update mode. I believe that trying the tp10ubkbd code is safe,=

> esp. since this is using a 2 byte large output report and using that
> for fw-updating would be a bit weird. Still there is a small risk
> (there always is when poking hw) so I will leave it up to you if
> you are willing to try this.

No issue at all, and everything below works just as expected.

> Here is how I test this (note you will need to adjust the paths a bit) =
:
>=20
> Toggle the 2 mute LEDs:
>=20
> [root@localhost ~]# echo 1 > /sys/class/leds/0003:17EF:6062.000E:amber:=
micmute/brightness
> [root@localhost ~]# echo 0 > /sys/class/leds/0003:17EF:6062.000E:amber:=
micmute/brightness
> [root@localhost ~]# echo 1 > /sys/class/leds/0003:17EF:6062.000E:amber:=
mute/brightness
> [root@localhost ~]# echo 0 > /sys/class/leds/0003:17EF:6062.000E:amber:=
mute/brightness
>=20
> Check Fnlock LED state (toggle on kbd by pressing Fn + Esc) :
>=20
> [root@localhost ~]# cat /sys/bus/hid/devices/0003:17EF:6062.000E/fn_loc=
k
> 1
> [root@localhost ~]# cat /sys/bus/hid/devices/0003:17EF:6062.000E/fn_loc=
k
> 0
>=20
> Change Fnlock state from within Linux:
>=20
> [root@localhost ~]# echo 1 > /sys/bus/hid/devices/0003:17EF:6062.000E/f=
n_lock
> [root@localhost ~]# echo 0 > /sys/bus/hid/devices/0003:17EF:6062.000E/f=
n_lock
>=20
> (The Led on the kbd should update; and the F## key behavior should chan=
ge)
>=20
> Regards,
>=20
> Hans


Cheers,
Alex

--------------4023B6BA6F6E2CE1115A0AC0
Content-Type: text/plain; charset=UTF-8;
 name="hidrawscan0"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="hidrawscan0"

IyBlY2hvICdGbiArIFsgcywgNCBdJzsgc2xlZXAgMTsgc3VkbyB4eGQgLWIgLWM0IC9kZXYv
aGlkcmF3MApGbiArIFsgcywgNCBdCgojIEZuK1Mgc2hvdWxkIGJlIFN5c1JxCkZuK1MgcHJl
c3M6ICAgMDAwMDAwMDA6IDAwMDAwMDAwIDAwMDAwMDAwIDEwMDExMDEwIDAwMDAwMDAwICAu
Li4uCiAgICAgICAgICAgICAgMDAwMDAwMDQ6IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAw
IDAwMDAwMDAwICAuLi4uCkZuK1MgcmVsZWFzZTogMDAwMDAwMDg6IDAwMDAwMDAwIDAwMDAw
MDAwIDAwMDAwMDAwIDAwMDAwMDAwICAuLi4uCiAgICAgICAgICAgICAgMDAwMDAwMGM6IDAw
MDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwICAuLi4uCgojIEZuKzQgc2hvdWxk
IGJlICJzbGVlcCIKRm4rNCBwcmVzczogICAwMDAwMDAwMDogMDAwMDAwMDAgMDAwMDAwMDAg
MDExMTAwMTAgMDAwMDAwMDAgIC4uci4KICAgICAgICAgICAgICAwMDAwMDAwNDogMDAwMDAw
MDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgIC4uLi4KRm4rNCByZWxlYXNlOiAwMDAw
MDAwODogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgIC4uLi4KICAgICAg
ICAgICAgICAwMDAwMDAwYzogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAg
IC4uLi4KIyBzdWJzZXF1ZW50IHByZXNzZXMgb2YgRm4rNCBkbyBub3QgcmVwb3J0IGFueXRo
aW5nCiMgdW50aWwgaGlkX2xlbm92byBpcyByZW1vdmVkIGFuZCByZS1pbnNlcnRlZAo=
--------------4023B6BA6F6E2CE1115A0AC0
Content-Type: text/plain; charset=UTF-8;
 name="hidrawscan1"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="hidrawscan1"

IyBlY2hvICdGbiArIFsgRm5Mb2NrLCBGMSwgLi4uLCBGMTIsIFBydFNjLCBTcGFjZSwgU3Bh
Y2UsIFNwYWNlLCBTcGFjZSBdJzsgeHhkIC1iIC1jNCAvZGV2L2hpZHJhdzEKRm4gKyBbIEZu
TG9jaywgRjEsIC4uLiwgRjEyLCBQcnRTYywgU3BhY2UsIFNwYWNlLCBTcGFjZSwgU3BhY2Ug
XQoKRm5Mb2NrIFByZXNzOiAgIDAwMDAwMDAwOiAwMDAwMDAxMSAwMDAwMDAwMCAwMDAwMDAw
MSAwMDAwMDAwMCAgLi4uLgpGbkxvY2sgUmVsZWFzZTogMDAwMDAwMDQ6IDAwMDAwMDExIDAw
MDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwICAuLi4uCgpGMSBQcmVzczogICAgICAgMDAwMDAw
MDg6IDAwMDAwMDExIDAwMTAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwICAuIC4uCkYxIFJlbGVh
c2U6ICAgICAwMDAwMDAwYzogMDAwMDAwMTEgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAg
IC4uLi4KRjIgUHJlc3M6ICAgICAgIDAwMDAwMDEwOiAwMDAwMDAxMSAwMDAwMDAwMCAwMDAw
MDAwMCAwMDAxMDAwMCAgLi4uLgpGMiBSZWxlYXNlOiAgICAgMDAwMDAwMTQ6IDAwMDAwMDEx
IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwICAuLi4uCkYzIFByZXNzOiAgICAgICAwMDAw
MDAxODogMDAwMDAwMTEgMDAwMDAwMDAgMDAwMDAwMDAgMDAxMDAwMDAgIC4uLgpGMyBSZWxl
YXNlOiAgICAgMDAwMDAwMWM6IDAwMDAwMDExIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAw
ICAuLi4uCkY0IFByZXNzOiAgICAgICAwMDAwMDAyMDogMDAwMDAwMTEgMDAwMDAwMDAgMDAw
MDAwMTAgMDAwMDAwMDAgIC4uLi4KRjQgUmVsZWFzZTogICAgIDAwMDAwMDI0OiAwMDAwMDAx
MSAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAgLi4uLgpGNSBQcmVzczogICAgICAgMDAw
MDAwMjg6IDAwMDAwMDExIDAwMDAwMDAwIDAwMDAwMDAwIDAxMDAwMDAwICAuLi5ACkY1IFJl
bGVhc2U6ICAgICAwMDAwMDAyYzogMDAwMDAwMTEgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAw
MDAgIC4uLi4KRjYgUHJlc3M6ICAgICAgIDAwMDAwMDMwOiAwMDAwMDAxMSAwMDAwMDAwMCAw
MDAwMDAwMCAwMDAwMTAwMCAgLi4uLgpGNiBSZWxlYXNlOiAgICAgMDAwMDAwMzQ6IDAwMDAw
MDExIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwICAuLi4uCkY3IFByZXNzOiAgICAgICAw
MDAwMDAzODogMDAwMDAwMTEgMDAwMDAwMDAgMDAxMDAwMDAgMDAwMDAwMDAgIC4uIC4KRjcg
UmVsZWFzZTogICAgIDAwMDAwMDNjOiAwMDAwMDAxMSAwMDAwMDAwMCAwMDAwMDAwMCAwMDAw
MDAwMCAgLi4uLgpGOCBQcmVzczogICAgICAgMDAwMDAwNDA6IDAwMDAwMDExIDAwMDAwMDAw
IDAxMDAwMDAwIDAwMDAwMDAwICAuLkAuCkY4IFJlbGVhc2U6ICAgICAwMDAwMDA0NDogMDAw
MDAwMTEgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgIC4uLi4KRjkgUHJlc3M6ICAgICAg
IDAwMDAwMDQ4OiAwMDAwMDAxMSAwMDAwMDAwMCAwMDAwMDEwMCAwMDAwMDAwMCAgLi4uLgpG
OSBSZWxlYXNlOiAgICAgMDAwMDAwNGM6IDAwMDAwMDExIDAwMDAwMDAwIDAwMDAwMDAwIDAw
MDAwMDAwICAuLi4uCkYxMCBQcmVzczogICAgICAwMDAwMDA1MDogMDAwMDAwMTEgMDAwMDAw
MDEgMDAwMDAwMDAgMDAwMDAwMDAgIC4uLi4KRjEwIFJlbGVhc2U6ICAgIDAwMDAwMDU0OiAw
MDAwMDAxMSAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAgLi4uLgpGMTEgUHJlc3M6ICAg
ICAgMDAwMDAwNTg6IDAwMDAwMDExIDAwMDAwMDEwIDAwMDAwMDAwIDAwMDAwMDAwICAuLi4u
CkYxMSBSZWxlYXNlOiAgICAwMDAwMDA1YzogMDAwMDAwMTEgMDAwMDAwMDAgMDAwMDAwMDAg
MDAwMDAwMDAgIC4uLi4KRjEyIFByZXNzOiAgICAgIDAwMDAwMDYwOiAwMDAwMDAxMSAwMDAw
MDEwMCAwMDAwMDAwMCAwMDAwMDAwMCAgLi4uLgpGMTIgUmVsZWFzZTogICAgMDAwMDAwNjQ6
IDAwMDAwMDExIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwICAuLi4uCgpQcnRTYyBQcmVz
czogICAgMDAwMDAwNjg6IDAwMDAwMDExIDAwMDAxMDAwIDAwMDAwMDAwIDAwMDAwMDAwICAu
Li4uClBydFNjIFJlbGVhc2U6ICAwMDAwMDA2YzogMDAwMDAwMTEgMDAwMDAwMDAgMDAwMDAw
MDAgMDAwMDAwMDAgIC4uLi4KClNwYWNlIFByZXNzOiAgICAwMDAwMDA3MDogMDAwMDAwMTEg
MDAwMDAwMDAgMTAwMTAwMDAgMDAwMDAwMDEgIC4uLi4KU3BhY2UgUHJlc3M6ICAgIDAwMDAw
MDc0OiAwMDAwMDAxMSAwMDAwMDAwMCAxMDAxMDAwMCAwMDAwMDAwMSAgLi4uLgpTcGFjZSBQ
cmVzczogICAgMDAwMDAwNzg6IDAwMDAwMDExIDAwMDAwMDAwIDEwMDEwMDAwIDAwMDAwMDAx
ICAuLi4uClNwYWNlIFByZXNzOiAgICAwMDAwMDA3YzogMDAwMDAwMTEgMDAwMDAwMDAgMTAw
MTAwMDAgMDAwMDAwMDEgIC4uLi4K
--------------4023B6BA6F6E2CE1115A0AC0
Content-Type: text/x-csrc; charset=UTF-8;
 name="lenovo_input_mapping_x1_tab_kbd.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="lenovo_input_mapping_x1_tab_kbd.c"

static int lenovo_input_mapping_x1_tab_kbd(struct hid_device *hdev,
		struct hid_input *hi, struct hid_field *field,
		struct hid_usage *usage, unsigned long **bit, int *max)
{
	/*
	 * The ThinkPad X1 Tablet Thin Keyboard uses 0x000c0001 usage for
	 * a bunch of keys which have no standard consumer page code.
	 */
	// FIXME the below mappings are taken for the tp10_ultrabook_kbd mapping=
 function
	// these may very well need to be changed for the X1 Tablet Thin Keyboar=
d
	if (usage->hid =3D=3D 0x000c0001) {
		switch (usage->usage_index) {
		case 8: /* Fn-Esc: Fn-lock toggle */
			map_key_clear(KEY_FN_ESC);
			return 1;
		case 9: /* Fn-F4: Mute/unmute microphone */
			map_key_clear(KEY_MICMUTE);
			return 1;
		case 10: /* Fn-F9: Settings */
			map_key_clear(KEY_CONFIG);
			return 1;
		case 13: /* Fn-F7: Manage external displays */
			map_key_clear(KEY_SWITCHVIDEOMODE);
			return 1;
		case 14: /* Fn-F8: Enable/disable wifi */
			map_key_clear(KEY_WLAN);
			return 1;

		/* FIXME: cases 16-19 don't work */
		case 16: /* Fn-F10: Enable/disable bluetooth */
			map_key_clear(KEY_BLUETOOTH);
			return 1;
		case 17: /* Fn-F11: Keyboard settings */
			map_key_clear(KEY_KEYBOARD);
			return 1;
		case 18: /* Fn-F12: User function / Cortana */
			map_key_clear(KEY_MACRO1);
			return 1;
		case 19: /* Fn-PrtSc: Snipping tool */
			map_key_clear(KEY_SELECTIVE_SCREENSHOT);
			return 1;
		}
	}

	return 0;
}

--------------4023B6BA6F6E2CE1115A0AC0--

--------------ms000101040906070007060602
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
Ew0wggY9MIIEJaADAgECAgg3B676YzbKKTANBgkqhkiG9w0BAQsFADBSMQswCQYDVQQGEwJE
RTEXMBUGA1UECgwORnJhdW5ob2ZlciBTSVQxKjAoBgNVBAMMIVZvbGtzdmVyc2NobHVlc3Nl
bHVuZyBSb290IENBIEcwMjAeFw0yMDA1MjYxMzIxNDFaFw0zMDA1MjUxMzIxNDFaMFUxCzAJ
BgNVBAYTAkRFMRcwFQYDVQQKDA5GcmF1bmhvZmVyIFNJVDEtMCsGA1UEAwwkVm9sa3N2ZXJz
Y2hsdWVzc2VsdW5nIFByaXZhdGUgQ0EgRzAyMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
CgKCAgEAzW9OcLabPtfz9rbgtyyuNQCQkmI8cPW39VGsXLX1J9EIcUPvp1ysi6kuqMfw+YOC
LjxopSIhpjhH/p84LzmcBJElRPkzWHJreZry+Lu5SDhOcOH49fNEo7UeYE0wkSJNv+jLMWwU
H93dPaSNeRN/5/Peq6tcKTx0FflS2ZScP9OcPvXgp1c/bXYoRyiOGSVR8/+7qlwNuku2px6f
0c6XOKOwkyTeSghmQ8vdfeqcMd9fNUhn/ijWFHahr0LUGB9We6SoxklOz9gfgSCjhInt+4qy
N6bHl/utH/vj1qnuhkaP25h1eCbz2WKqv0wKWwa/r4F0ItLYYP2YhwICTNLDDT8GmctRdt2S
yLmgXo9Gz0nrwrYuGMWcXNLm682Fgg3wQne0DTszFFUU8PrVOtgzB5Qm6DPrRSUHXQEfT7DY
ZzDA+FmSoTSiCe+aoNPbglta4gDar0B/gni15LtCzW4tNhk3fXkYxEWpbq32vNy3wCDOQazc
vxzko5Ior1iDZJNuzurtp5qRjAnOcUiKhNUJeBnmLDB/Di9XZHIQCD0EjiZzef0OR4+ZbPPM
xl6n9KHdrZ2c8r3yjGJtGkeMc0aMkBpvYNDy/s4fYnE5MRIOWdmMnq23/DvCpsQtF5UWZlF9
MaKVcjXmtGpnhpe0XOkFXvxd9PSM0Oe4uei+buhbF7ECAwEAAaOCARIwggEOMBIGA1UdEwEB
/wQIMAYBAf8CAQAwHwYDVR0jBBgwFoAUPnwBB805qJCxODW0j7v1rBeEocAwTQYIKwYBBQUH
AQEEQTA/MD0GCCsGAQUFBzAChjFodHRwOi8vdm9sa3N2ZXJzY2hsdWVzc2VsdW5nLmRlL2Nh
L3Jvb3RjYV9nMDIuY3J0MBQGA1UdIAQNMAswCQYHKyQPCQMBATBDBgNVHR8EPDA6MDigNqA0
hjJodHRwOi8vdm9sa3N2ZXJzY2hsdWVzc2VsdW5nLmRlL2NybC9yb290Y2FfZzAyLmNybDAd
BgNVHQ4EFgQUBNGCAAc5XwIAgrw4HtCXwN3HOwMwDgYDVR0PAQH/BAQDAgEGMA0GCSqGSIb3
DQEBCwUAA4ICAQAPsI1fETAPUfq7LoI2FxRDylRduC/nVhVca7ORxhZXrFmksT/q1jHU4eXK
IhcVms623/FHhcVHl1qB5G/cgU2OtjEP5/BXIRu4I78EZIhb8U3ZGe9gZql/RSOBD08lhmzv
fRz+nwE2Pl9stzXKohjGRWyfFfuaWKLXUZzCK/wYX6IqhTxjkoEFSgejoO41B886rrm3+aaO
5Db5EBW4gYWF9VCV3bmedmTJzbvOOYDxaVT1+O8E9Ym5BZL+qJNjgdjJXE1TUGyUg6ZweNHT
dse6xTc9KhfnAyppkMUu9AKT6jkloA6l0/T3zEMKhvtf9gLYWJ0zMwm1JfQk5mVMZtQoOPYI
Wj7IVUKPZJMizHoaAAIzi7C0w3XpN3xMDJOs5eRsRPk0qF8UulshIUA/6idOrg7eUY4WZGN1
RZsFYyhBg1sPaeFyFAUs0XJUrWLOKO5f9VZGbmEF6gqbTxdwMCJZzonwpUxVwxKLMa+Z4EMG
QoY1rLNPCRZlzhW+TRBsuy4tGN21PlhvcvEnxs8eHvqlwfM/KwYtXhLG8881KMMSzemRvX/c
pNCU2YlHpAwpdm6cAn60leS0WPfTb6QAqmtQTij6uAfFN46hQDLqpfTWnoPSMvbeyFwqP6Fv
V6RgquAIpe9p5daLY9M+Krkd7mH8QR2PN615TboR0ocoF4REdTCCBlwwggREoAMCAQICCBUM
N0NLozG+MA0GCSqGSIb3DQEBCwUAMFUxCzAJBgNVBAYTAkRFMRcwFQYDVQQKDA5GcmF1bmhv
ZmVyIFNJVDEtMCsGA1UEAwwkVm9sa3N2ZXJzY2hsdWVzc2VsdW5nIFByaXZhdGUgQ0EgRzAy
MB4XDTIwMTAxMTE2NTIzN1oXDTIzMTAxMDE2NTIzN1owgYkxGDAWBgNVBAMMD0FMRVhBTkRF
UiBLT0JFTDEOMAwGA1UEBAwFS09CRUwxEjAQBgNVBCoMCUFMRVhBTkRFUjFJMEcGA1UEBRNA
RDQwMDNFMTc4OTlGMTQzMTI2ODExMzM0OUY1N0M1QzU0NEQ5RjcwNDVCQTkyMEJEMzdDQURB
NTQzOEFGQ0EzODCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAM9yNVKr/cuT0WnJ
PLe7kmfd5Wo7rlb1F+harCy3OLgaTqkMI6j37OTXMAmdkZ0y7zrlhbEGCEpODaDPYwVSEb+s
Cv05n3SAMCdy9kQlnqP9We7C/2mbnuKYhpO5P6mUVdPoM+tfTM22YH7CzO8sa1Tq1s/DrIZs
NhXDRvWZEdDwUCjLPKVXGtTqHbUjs7OufxpbyzA7xHE5N7qRff1WrOuq/RS1OvGZVcUjLAmI
loYCvYm1Q3oBYuSZygOsawjmJQ14fh7dKkOjogx6byElWAVBkUQxud8CtBHW+L4VY35uinRJ
k81mwI8ac0zS5FEbYWoF9Gi5pWbCgoIvGXIMcPEQqu8mVBpN/CAMUOUlIkOPDvFqfiQ9TI2C
xnNih8csWwVInRS7m8itJrnlbVfDwdHMJhPT522gCDOC6lXaRUizwGqRh/26W1dJqA2SYmEn
EMH/TcP3eyiFLN5QDXm2odnh+rbvQbwEtlPxup24HGe8RqWFdiCOW1syM+V74lUn5wIDAQAB
o4IBeTCCAXUwHQYDVR0RBBYwFIESYS1rb2JlbEBhLWtvYmVsLmRlMA4GA1UdDwEB/wQEAwIG
wDATBgNVHSUEDDAKBggrBgEFBQcDBDAMBgNVHRMBAf8EAjAAMB8GA1UdIwQYMBaAFATRggAH
OV8CAIK8OB7Ql8DdxzsDMIGCBggrBgEFBQcBAQR2MHQwQAYIKwYBBQUHMAKGNGh0dHA6Ly92
b2xrc3ZlcnNjaGx1ZXNzZWx1bmcuZGUvY2EvcHJpdmF0ZWNhX2cwMi5jcnQwMAYIKwYBBQUH
MAGGJGh0dHA6Ly9vY3NwLnZvbGtzdmVyc2NobHVlc3NlbHVuZy5kZTAUBgNVHSAEDTALMAkG
ByskDwkDAQEwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0cDovL3ZvbGtzdmVyc2NobHVlc3NlbHVu
Zy5kZS9jcmwvcHJpdmF0ZWNhX2cwMi5jcmwwHQYDVR0OBBYEFDadSlBdeaipQdbmS4vn439F
6fkNMA0GCSqGSIb3DQEBCwUAA4ICAQBUhcmTTecspwaSgUUlrG/gUPzDLM/Ty0Jpz4GvRbRn
kJxHlHAopkk8P1SXlnOy2kfC5LgFCRB9tJqSlXmIXwphm90fZKRGZU2dBgxGkDQppXGH6PjJ
P52QAhvpztJDPEqfqkzcpKdkYuFg+KEzqZmsu8Mvy4rqCTRIAtOX5zHVFEIarp7YUMNhzGxg
eQakmDjykC1Xksx/ULsX7r5QW5Fqp1ZL5obNmA2emJgn0VrKRIYY8vqnOwUi13G/lDa+fphz
PMhpIKOKQ9Wy0Wn8mBdSdIqmt2L58Pu14ygwOkK3vnb/QKqayhwme2uf4waXG5or3wZdSr39
SvvGZT8Z6cHw6n7Jw0+gRApkB1cUO7j1T/aHCBcZPJ5i6bBoGrT5E8IHIqj+oZXUCY7jxknL
aHaiOARg8fFkf8lp3uy7ay4WcDIorPa9ugNaCP3SnYvtKvk44ulgMIjhvkG1Mga/70SA9Evq
3cFUle3jaaEYujSxLnN8LVm39dR93QCqcdkIayPA9LT6vizlGoA6BdOMWDzKWWnoelYTb+Ip
iqpafot50MCUqf1e2T0z8Ygki1LLOxlpi/DWQApb/Qq9EomeEYMKm0aJc7166pLiWsk1fWOX
kwBa3phG+CbbUxqotGP++r39Dk8Diny+lYjkRXpoqggzF9g9uxARXBIw0H+G6XbgCzCCBmgw
ggRQoAMCAQICCGRFBiAAmYjgMA0GCSqGSIb3DQEBCwUAMFUxCzAJBgNVBAYTAkRFMRcwFQYD
VQQKDA5GcmF1bmhvZmVyIFNJVDEtMCsGA1UEAwwkVm9sa3N2ZXJzY2hsdWVzc2VsdW5nIFBy
aXZhdGUgQ0EgRzAyMB4XDTIwMTAxMTE2NTIyM1oXDTIzMTAxMDE2NTIyM1owgYkxGDAWBgNV
BAMMD0FMRVhBTkRFUiBLT0JFTDEOMAwGA1UEBAwFS09CRUwxEjAQBgNVBCoMCUFMRVhBTkRF
UjFJMEcGA1UEBRNARDQwMDNFMTc4OTlGMTQzMTI2ODExMzM0OUY1N0M1QzU0NEQ5RjcwNDVC
QTkyMEJEMzdDQURBNTQzOEFGQ0EzODCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGB
AIHe4er7YlQrv+fgKBYbb2FSJLtzoB9s4ZhYgIfQuR1x9+WJvj9EMne5rsHB+OJ5bwZQ1Fnh
qhJhtepikZhLDRVfRbzRdrOSzxnkePhH/SZ9VhtN6327PuSAwxe/te/DPDo6aWZj3d7RoioE
UgkyF5gNWYu082LeSHbvNpDcHUN2Rs7XgZi5uBUnHR1btXA7BOzUMfPhEIqwuCDKLZAGCc0q
2JKhKeOIOsoZ8lP2/HfW3Az1ij6xztb/HfoZnyZMpQC1ly7VgJU5rTLRJz39kscZSBcnxRqP
8cE9rrlPZOgRPK2NR4x+30Sr9sOtnbRYldKWT4uCtqrPrnxNKiDkv3P2h1yKYbCamlqwaoJW
cjrphzLycSGHitalla/f82xHSN+7gJHGp91WYIn+c6jPLcx0wmKUJBB1TIEaeh4izkqLwB0P
1HUBHo50OdmTnRGdnvNt/+Xsc9KetVnmJM2bqXXDlgYMfsULoe6Y0AVemQFvd1V49GePGpGT
NGMe5jf7NwIDAQABo4IBhTCCAYEwHQYDVR0RBBYwFIESYS1rb2JlbEBhLWtvYmVsLmRlMA4G
A1UdDwEB/wQEAwIEMDAfBgNVHSUEGDAWBgorBgEEAYI3CgMEBggrBgEFBQcDBDAMBgNVHRMB
Af8EAjAAMB8GA1UdIwQYMBaAFATRggAHOV8CAIK8OB7Ql8DdxzsDMIGCBggrBgEFBQcBAQR2
MHQwQAYIKwYBBQUHMAKGNGh0dHA6Ly92b2xrc3ZlcnNjaGx1ZXNzZWx1bmcuZGUvY2EvcHJp
dmF0ZWNhX2cwMi5jcnQwMAYIKwYBBQUHMAGGJGh0dHA6Ly9vY3NwLnZvbGtzdmVyc2NobHVl
c3NlbHVuZy5kZTAUBgNVHSAEDTALMAkGByskDwkDAQEwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0
cDovL3ZvbGtzdmVyc2NobHVlc3NlbHVuZy5kZS9jcmwvcHJpdmF0ZWNhX2cwMi5jcmwwHQYD
VR0OBBYEFJiKTcJJSCtBVQS6oS4OSO8QKEWBMA0GCSqGSIb3DQEBCwUAA4ICAQBfdnVpzlnO
JupsJfdYW9xyt3lSky85oA1qPichmW6UjrnIZdunQPJrCTTM+7wUqeqwlhbRmwUKgAPH/5fc
cOnyMulgbvc50VV+mBK4ph/1/fhom7zJYEfvKEpPWg5tGx3/Mp6YIVvuhRnZ7vmodMGXgj/f
1D7yHFJib/430e6pcD76DPaAFA1cVVp5FUP+b0fBzvgYjsgSwL2GTXXaNGEaLqBuhtmInBh/
y4X2ZEz8kw6B2P0GpQ8jg+5I1tNM6vf/KH2FxDj/ykmSsgtyrQAddEjrNQbaQAzXTtHAPui/
6/wbgYfLp05aH7PsLsKGdDS9yb8UaWfWgwFuFz3dLXSdI3YYhXB2QnASX5RV3ndnu9vwGmns
c6iu4C9+h0hFdcWMIEso5K/mV/kXO31xzw7JLU2y5Nk7XEgrXwqFuX4ZruqCfw3EXP1hYnmt
OtfAaSLzTdBS0GskGGnWAs12dJrL8FysZbtX5cgWMyT1nun8ksvSodVgQ+7BA5YHTwfHussP
nPBDabaHmlOUVBi3IYZvoJ90XwuuMvVqcYeEzvuGDrssZHY2pG9DqTeXfzmUdpTfMy7zwu5K
jBPKilDLTXJkrA5wlQpSihjSQG/UPLP+YDsrEuwwBC1DbcSn5KOyMXFpfxsoSegFzb0lxPRc
6sScLr/v96FwvwWpL54Fp9dr0TGCA80wggPJAgEBMGEwVTELMAkGA1UEBhMCREUxFzAVBgNV
BAoMDkZyYXVuaG9mZXIgU0lUMS0wKwYDVQQDDCRWb2xrc3ZlcnNjaGx1ZXNzZWx1bmcgUHJp
dmF0ZSBDQSBHMDICCBUMN0NLozG+MA0GCWCGSAFlAwQCAQUAoIIBvTAYBgkqhkiG9w0BCQMx
CwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTAyMjExMzE3NTFaMC8GCSqGSIb3DQEJ
BDEiBCC2UJL3B40sA4Y8n4ELFhy8imwHM2KocjJA8qP7OTy63DBsBgkqhkiG9w0BCQ8xXzBd
MAsGCWCGSAFlAwQBKjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCA
MA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMHAGCSsGAQQBgjcQBDFj
MGEwVTELMAkGA1UEBhMCREUxFzAVBgNVBAoMDkZyYXVuaG9mZXIgU0lUMS0wKwYDVQQDDCRW
b2xrc3ZlcnNjaGx1ZXNzZWx1bmcgUHJpdmF0ZSBDQSBHMDICCGRFBiAAmYjgMHIGCyqGSIb3
DQEJEAILMWOgYTBVMQswCQYDVQQGEwJERTEXMBUGA1UECgwORnJhdW5ob2ZlciBTSVQxLTAr
BgNVBAMMJFZvbGtzdmVyc2NobHVlc3NlbHVuZyBQcml2YXRlIENBIEcwMgIIZEUGIACZiOAw
DQYJKoZIhvcNAQEBBQAEggGAuyHS6hpQF+GbdvRkb/yM5jsW078YzJDG/PHD5sJmvsx55hRO
W6KM2uksx1/ZuV5iua+MCqFnQ9HdBU58caLchhB2mGLDzYh/zoWXTL+V1dcNgejmqQtKi84P
QYcjNyIb74DGRe+bmw9OPCk4oNtky1Sf9LmQXNcD67Y1yCe2LoCgH2qpqFpTxd4F6ff6B0Y2
1Imj61+EPZ+knB53rfgW7O5OVVkamd8FslfJ+o5WnZ9TCJ8CoLZ8BnTGKP8ZypG4+9cb+uB2
6tPAK7wJcz5NOVjrQSCqpxT4NMJ7zXLHJpZktqo7xZBMCQ/nyzNKlvvDH1yzk4kH576HQnju
wXfvzFQJiefcnnBGe8a595XzaYn74VMI7EwX69Vx8lQ/uKIo94TrToky1/WlZgVQAU5nq/ss
+EuY9/35jU40iQf5Hg2k9tbD0cW03/nosN49aZMxR5ICpN94gYb2EVZMv8B1BcOVhwEBeRzn
nvnv8yILCQFQhVEsWmVG/OERJgRxXuzTAAAAAAAA
--------------ms000101040906070007060602--
