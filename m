Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C9E3216C3
	for <lists+linux-input@lfdr.de>; Mon, 22 Feb 2021 13:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhBVMdW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Feb 2021 07:33:22 -0500
Received: from ganymed.uberspace.de ([185.26.156.242]:40605 "EHLO
        ganymed.uberspace.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbhBVMcl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Feb 2021 07:32:41 -0500
Received: (qmail 26253 invoked from network); 22 Feb 2021 12:31:50 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
  by ganymed.uberspace.de with SMTP; 22 Feb 2021 12:31:50 -0000
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
 <b1392cd8-eefc-4fff-d327-5159714ba304@a-kobel.de>
 <b61d2451-f9f2-1b2c-bd7b-193713d87dbc@redhat.com>
From:   Alexander Kobel <a-kobel@a-kobel.de>
Message-ID: <7007c7e4-c24f-93a1-53e4-bd497e2d7e83@a-kobel.de>
Date:   Mon, 22 Feb 2021 13:31:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b61d2451-f9f2-1b2c-bd7b-193713d87dbc@redhat.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms020304000803090408030301"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms020304000803090408030301
Content-Type: multipart/mixed;
 boundary="------------9888E1105258984A91B5BB71"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9888E1105258984A91B5BB71
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 2/21/21 5:30 PM, Hans de Goede wrote:
> Hi,
>=20
> On 2/21/21 2:17 PM, Alexander Kobel wrote:
>> Hi,
>>
>> finally I got to investigate that patch. Thanks for your draft and exp=
lanations!
>>
>> On 2/12/21 12:42 AM, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 2/9/21 4:16 PM, Alexander Kobel wrote:
>>>> Hi,
>>>>
>>>> On 2/8/21 11:17 AM, Hans de Goede wrote:
>>>>> On 2/7/21 6:55 PM, Alexander Kobel wrote:
>>>>>> <snip>
>>>>>> I'll go off and try to improve.
>>>>>
>>>>> So Nitin has been kind enough to provide us with some docs for this=
,
>>>>> please see me reply to Nitin's email and lets continue this part of=
 this mail
>>>>> thread there.
>>>>
>>>> Right. I have the other patch ready, thanks to your great help. I'm
>>>> waiting for Nitin's okay whether / how much info I can copy from the=

>>>> reference sheet to source code comments. Once I have that confirmati=
on,
>>>> I will post the revised patch.
>>>>
>>>>> <snip>
>>>>>
>>>>>> Finally, I mentioned some open ends already on a post to ibm-acpi-=
devel
>>>>>> at https://sourceforge.net/p/ibm-acpi/mailman/message/37200082/; t=
his
>>>>>> very question is among them.
>>>>>> I will start tackling the SW_TABLET_MODE event issue first, but if=
 Mark
>>>>>> and Nitin can already hint about the keyboard shortcuts, it'd be h=
ighly
>>>>>> appreciated.
>>>>>
>>>>> I think I might be able to help there, a couple of months ago I bou=
ght
>>>>> a second-hand thinkpad-10 tablet which also has a USB attached keyb=
oard.
>>>>>
>>>>> In hindsight I guess I could have asked Mark and Nitin for some mor=
e info,
>>>>> but I went on autopilot and just ran hexdump -C on the /dev/hidraw =
node
>>>>> to see which events all the keys send.
>>>>>
>>>>> And I fired up an usb-sniffer under Windows to figure out the audio=
-leds,
>>>>> since I'm used to just figure these things out without help from th=
e vendor :)
>>>>
>>>> Yeah, why take the boring route if you know how to do all the work o=
n
>>>> your own... ;-)
>>>>
>>>>> See the recent commits here for my work on this:
>>>>>
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
log/drivers/hid/hid-lenovo.c
>>>>
>>>> Thanks, very helpful.
>>>>
>>>>> So on the ibm-acpi list message you said that the kbd sends the fol=
lowing:
>>>>>
>>>>> type 4 (EV_MSC), code 4 (MSC_SCAN), value c0001
>>>>> type 1 (EV_KEY), code 240 (KEY_UNKNOWN), value 1
>>>>>
>>>>> For the Fn-keys, does it send the same MSC_SCAN code for *all* the
>>>>> non-working Fn-keys ?
>>>>
>>>> Correct. And I can confirm that /dev/hidraw1 lets me distinguish bet=
ween
>>>> the keys.
>>>>
>>>>> If so then it seems that this is very much like the thinkpad 10 kbd=
 dock
>>>>> which also does this, see the lenovo_input_mapping_tp10_ultrabook_k=
bd()
>>>>> function in drivers/hid/hid-lenovo.c .
>>>>>
>>>>> If I have that right, then I think we should be able to get the
>>>>> Fn keys to work without too much trouble. You could try hacking up
>>>>> drivers/hid/hid-lenovo.c a bit:
>>>>
>>>> (Not yet there, but will investigate.)
>>>>
>>>>> 1. Add an entry to the lenovo_devices array like this:
>>>>>
>>>>> 	/*
>>>>> 	 * Note bind to the HID_GROUP_GENERIC group, so that we only bind =
to the keyboard part,
>>>>> 	 * while letting hid-multitouch.c handle the touchpad and trackpoi=
nt.
>>>>> 	 */
>>>>>         { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>>>>>                      USB_VENDOR_ID_LENOVO,
>>>>>                      USB_DEVICE_ID_LENOVO_X1_TAB),
>>>>>
>>>>> 2. Add the following entry to the switch-case in lenovo_input_mappi=
ng() :
>>>>>
>>>>>         case USB_DEVICE_ID_LENOVO_X1_TAB:
>>>>>                 return lenovo_input_mapping_tp10_ultrabook_kbd(hdev=
, hi, field,
>>>>>                                                                usag=
e, bit, max);
>>>>>
>>>>> And then build hid-lenovo.c and modprobe it.
>>>>>
>>>>> After the modprobe to:
>>>>>
>>>>> ls -l /sys/bus/hid/devices/0003:17EF:60A3.*/driver
>>>>>
>>>>> This should show 2 devices (I guess) with one being bound to hid-le=
novo
>>>>> and 1 being bound to hid-multitouch.
>>>>
>>>> So far (without patching hid-lenovo), 2 bound to hid-generic and 1 t=
o
>>>> hid-multitouch.
>>>
>>> Ok, so it seems that they kept the thinkpad 10 kbd bits (mostly) with=

>>> 1 keyboard interface using the usb boot kbd interface (so that it wil=
l
>>> also work inside the BIOS) and a second interface for multimedia-keys=
 +
>>> the mouse emulation of the thinkpad 10 touchpad, those are interfaces=

>>> 1 and 2, except that they removed the mouse emulation as they added a=

>>> new proper multi-touch capable touchpad as interface 3; and that one
>>> also handles the pointing stick I believe.
>>>
>>> So yes 2 bound to hid-generic, 1 bound to hid-multitouch seems to be
>>> correct.
>>
>> Right, that's what I observe.
>>
>>>>> If this works some of your Fn + F# keys will now hopefully start do=
ing
>>>>> something, you can play around with modifying lenovo_input_mapping_=
tp10_ultrabook_kbd
>>>>> to make it do the right thing for your kbd.
>>>>> z
>>>>> ###
>>>>>
>>>>> About LED support, just enabling the LED support bits for the
>>>>> USB_DEVICE_ID_LENOVO_TP10UBKBD handling for now might work fine,
>>>>> but there is a tiny chance that sending the wrong command somehow p=
uts
>>>>> the kbd in firmware update mode, I had that happen once with a Logi=
tech
>>>>> kbd which did not seem to have any kind of handshake / passcode to =
avoid
>>>>> accidental fw updates (*).
>>>>>
>>>>> If you can give me a dump of the hid-descriptors for your keyboard,=

>>>>> then I can check if that the LEDs might work the same way too (or n=
ot).
>>>>>
>>>>> The easiest way to get a dump is to run the following command as ro=
ot:
>>>>>
>>>>> cat /sys/kernel/debug/hid/0003:17EF:60A3.*/rdesc > rdesc
>>>>>
>>>>> And then attach rdesc to your next email.
>>>>
>>>> Please find this one attached already now.
>>>> In case it helps, the * expands to 0057 0058 0059 on my system.
>>>
>>> Ok, so there still is an output-report number 9 on the second interfa=
ce,
>>> which probably still controls the LEDS but its descriptors are subtly=

>>> different. Although different in a good way I guess because the think=
pad
>>> 10 dock descriptor describes the 2 bytes in the output report as bein=
g
>>> in the range of 0-1 which is not how they are actually used.
>>>
>>> So I think that the code for the Thinkpad 10 ultrabook keyboard as
>>> Lenovo calls it, should also work on the X1 tablet thin keyboard.
>>
>> Mostly, modulo some key mappings, as expected.
>>
>> The good:
>>
>> LEDs are working exactly as expected with your patch, with the appropr=
iate triggers automatically active. Perfect!
>=20
> Good :)
>=20
>> The bad:
>>
>> I could adjust some of the key mappings for the X1 Tablet 2nd keyboard=
=2E What I couldn't do is to get Fn+F10, Fn+F11, Fn+F12 and Fn+PrtSc to w=
ork.
>> Following the logic of /dev/hidraw1 capture (attached), those should b=
e on usage_index 16 to 19. But apparently those are on a different usage =
page or something like that? Unfortunately, my RTFM skills didn't really =
help with figuring out how that's supposed to work.
>> (Is looking at the bit indices in /dev/hidraw traces how you figure ou=
t those mappings? If there's a better way, I'm eager to be told...)
>=20
> You are swapping to low and high byte of the 3 data bytes in the report=
=2E Here is an annotated part of the descriptors to explain better:
>=20
>   INPUT(3)[INPUT]
>     Field(0)
>       Application(Consumer.0001)
>       Usage(24)
>  0        Consumer.0001 F10 00000001 00000000 00000000
>  1        Consumer.0001 F11 00000010 00000000 00000000
>  2        Consumer.0001 F12 00000100 00000000 00000000
>  3        Consumer.0001 Prt 00001000 00000000 00000000
>  4        Consumer.0001
>  5        Consumer.00e2 F1  00100000 00000000 00000000
>  6        Consumer.0001
>  7        Consumer.0001
>  8        Consumer.0001 ESC 00000000 00000001 00000000
>  9        Consumer.0001 F4  00000000 00000010 00000000
> 10        Consumer.0001 F9  00000000 00000100 00000000
> 11        Consumer.00b7
> 12        Consumer.0001
> 13        Consumer.0001 F7  00000000 00100000 00000000
> 14        Consumer.0001 F8  00000000 01000000 00000000
> 15        Consumer.0001=20
> 16        Consumer.0001
> 17        Consumer.0001
> 18        Consumer.0001=20
> 19        Consumer.006f F6  00000000 00000000 00001000
> 20        Consumer.00ea F2  00000000 00000000 00010000
> 21        Consumer.00e9 F3  00000000 00000000 00100000
> 22        Consumer.0070 F5  00000000 00000000 01000000
> 23        Consumer.0001
>       Logical Minimum(0)
>       Logical Maximum(1)
>       Report Size(1)
>       Report Count(24)
>       Report Offset(0)
>       Flags( Variable Absolute )
>=20
> Notice how the keys with standard codes (which work without mapping)
> F1 - F3, F5, F6 now all line up with _none_ Consumer.0001 entries.
> And if you check those codes in drivers/hid/hid-input.c around
> line 960 you will see the standard mappings line up too.
>=20
> IOW your case 16 needs to be case 0, case 17, case 1, etc.

Gotcha, I suppose. At least on a shallow level... Thanks!
And, yes: that works perfectly.

>> Similarly - I assume - Fn+S should emit SysRq according to https://dow=
nload.lenovo.com/pccbbs/mobiles_pdf/x1_tablet_gen_2_ug_en.pdf, page 51. T=
his is not on the "consumer control" device, but the usual keyboard, so /=
dev/hidraw0. Again, couldn't get much further than producing a capture. B=
ut I cannot make sense of this one, because way more bits are set, so I c=
annot extrapolate from your code.
>=20
> The input report used by the Fn + key "media keys" use a 24 bit report
> with 1 bit per key. The standard keyboard interface uses 1 byte per
> pressed key (with a maximum of 6 pressed keys) where the full byte
> encodes the scancode of the key. Normally SysRq is 0x46 but for some
> reason your keyboard is sending 0x9a you can map this by adding the fol=
lowing
> to the mapping function:
>=20
> 	if (usage->hid =3D=3D (HID_UP_KEYBOARD | 0x009a))
> 		map_key_clear(KEY_SYSRQ);

And the same here, I think. Works with return 1; after the map_key_clear,=
 see the attached function.

> Likewise for the sleep combo:
>=20
> 	if (usage->hid =3D=3D (HID_UP_KEYBOARD | 0x0072))
> 		map_key_clear(KEY_SLEEP);

This seems unnecessary, as the sleep combo already emits KEY_SLEEP. Which=
 I don't quite get, cause - if I learned correctly how to read the rdesc =
- sleep should be on 0x0072 should emit F23 (and 0x0078 sleep), but the k=
ey produces the 0x0072 pattern according to hidraw.
By the way, the Fn+4 for sleep also works in hid-generic, and also just o=
nce, see below.

> ###
>=20
> Note chances are you have more Fn + 'letter' combinations at least on
> the thinkpad10 kbd I have:
>=20
> Fn + T -> SysRq
> Fn + I -> Insert
> Fn + P -> Pause
> Fn + S -> Sysrq
> Fn + K -> ScrollLock
> Fn + B -> Pause
>=20
> Note these do not need any special mappings on the thinkpad10 kbd and I=
 guess
> the doubles may have something to do with some non qwerty keymaps.

Not the same on this keyboard. I have Fn + {B,K,P,S,End,4} for {Break,Scr=
Lk,Pause,SysRq,Insert,Sleep}, but only SysRq was missing; the others are =
available on the "default" device, both with hid-lenovo and hid-generic.

>> The ugly:
>>
>> Fn+4 ("sleep") triggers the appropriate ACPI event button/sleep and em=
its something on /dev/hidraw0, too, but *only once*. After resuming, no r=
eaction at all (neither on ACPI nor hidraw) until I unload and reload the=
 hid_lenovo module.
>=20
> As for the sleep key working only once, what happens after a suspend/re=
sume ?

Nothing. At least nothing I can measure (via evtest, libinput debug-event=
s, cat /dev/hidraw*, dmesg, journal, acpi_listen). The key simply doesn't=
 react anymore.
Irrespective on how I wake the device. Even irrespective of whether I act=
ually suspend the device or disable the sleep handler altogether, e.g. by=
 systemd-inhibit. In only see the KEY_SLEEP press (no release!) event onc=
e until I reload the module or unplug and reattach the keyboard.
Very strange. And, by the way: the same for hid-generic.

> I think the key may have some special handling to avoid it sending
> a second KEY_SLEEP when the user uses it to wakeup the system, to
> avoid the system immediately going to sleep again when the user tries
> to wake the system this way.

Yes, that'd make sense. So probably the handler should restore something;=
 apparently, that part is initialized when the module is loaded, so it's =
not just the keyboard firmware.

>> Finally, keyboard backlight is handled in firmware, apparently; Fn+Spa=
ce is visible on /dev/hidraw1 (see attached capture), but it toggles the =
backlight levels without any userspace code involved, as far as I can see=
=2E
>=20
> Yes I saw this in your dump, this is really weird because it sets 3 bit=
s at once in the INPUT(3) report.
> Does it always set the same 3 bits independent of the brightness level =
?

Yes; the four key presses are actually one full cycle over off, auto, dim=
, and bright. hidraw dumps are identical.

>> Also, the keyboard backlight doesn't create an entry in /sys/class/bac=
klight or the like, so neither read nor write access. Out-of-the-box, at =
least. But I'm not even sure if this is possible in Windows.
>=20
> Actuallu kbd-backlighting used the /sys/class/leds interface, but yeah =
that is not support by Linux ATM for this kbd.
>=20
> Yeah, adding support for that (assuming the hw can do it) would definit=
ely require making some USB dumps under Windows
> (after finding sw which can change it from within the OS under Windows)=
=2E

I double-checked; somewhat unsurprisingly, there is at least a notificati=
on client on Windows that displays the new configuration after Fn+Space. =
The client only reports the setting; not sure if it would be technically =
feasible to also set the brightness level in software.


But anyways: I feel that I exploited your generosity in helping me far en=
ough. I hope I wasn't just fed, but learned a bit how to fish for myself =
in the future. So, unless you're really committed to walk me through this=
 further, I won't beg any further.

And in case you're looking for problems to tackle on the Tablet 2nd Gen, =
this one about the power button could be way more significant - but not s=
ure if it's in an area that you are familiar in:
https://bbs.archlinux.org/viewtopic.php?id=3D248857
https://bugzilla.kernel.org/show_bug.cgi?id=3D204763


>> Bottom line: this is mostly usable already, modulo the adjustments for=
 the different keys. I'd like to make F10 to F12 work before it hits test=
ing; everything else is icing on the cake, I suppose. Do you have an hint=
 for me how I can approach that?
>=20
> See above, I think we are pretty close to solving this.

Attached is the modified version of the input mapping for this keyboard, =
working subject to the above mentioned restrictions. I think this is fine=
=2E
As you did all the real work, I feel this should be your contribution. Bu=
t of course I can also prepare a patch on top of yours.

> Note in the mean time I've posted a hid-lenovo patch-series with variou=
s improvements related to
> the LED handling. I'll send you an offlist mail with the latest patches=
 so that you can base any work you do on top of those.

Didn't have a look yet, but will do.

>> Also, I'd make sure that this is about the "ThinkPad X1 Tablet Thin Ke=
yboard **Gen 2**". The consumer functions are different for the **Gen 1**=
 keyboard, so I would also adjust the function names. I do have an old Ge=
n 1 keyboard lying around, but unfortunately it's either broken (it light=
s up shortly after attaching in Windows, but doesn't report keypresses at=
 all, and pretends to be completely dead in Linux), or it's incompatible =
with my X1 Tablet 2nd Gen. So I cannot test how your patch might impact t=
he Gen1, too... :-/
>=20
> I would expect the Gen1 to have a different product-id, so my patch sho=
uldn't do anything.

Right. In this light, perhaps the function should still be called lenovo_=
input_mapping_x1_tab2_kbd (note the "2")?

>>> I've prepared a set of patches which enable the tp10ubkbd code on
>>> the X1 tablet thin keyboard. But beware as mentioned before there is =
a
>>> tiny chance that sending the wrong command somehow puts the kbd in
>>> firmware update mode. I believe that trying the tp10ubkbd code is saf=
e,
>>> esp. since this is using a 2 byte large output report and using that
>>> for fw-updating would be a bit weird. Still there is a small risk
>>> (there always is when poking hw) so I will leave it up to you if
>>> you are willing to try this.
>>
>> No issue at all, and everything below works just as expected.
>=20
> Good.
>=20
> Regards,
>=20
> Hans


Thanks a lot,
Alex

--------------9888E1105258984A91B5BB71
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
	if (usage->hid =3D=3D 0x000c0001) {
		switch (usage->usage_index) {
		case 0: /* Fn-F10: Enable/disable bluetooth */
			map_key_clear(KEY_BLUETOOTH);
			return 1;
		case 1: /* Fn-F11: Keyboard settings */
			map_key_clear(KEY_KEYBOARD);
			return 1;
		case 2: /* Fn-F12: User function / Cortana */
			map_key_clear(KEY_MACRO1);
			return 1;
		case 3: /* Fn-PrtSc: Snipping tool */
			map_key_clear(KEY_SELECTIVE_SCREENSHOT);
			return 1;
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
		}
	}

	if (usage->hid =3D=3D (HID_UP_KEYBOARD | 0x009a)) {
		map_key_clear(KEY_SYSRQ);
		return 1;
	}

	return 0;
}

--------------9888E1105258984A91B5BB71--

--------------ms020304000803090408030301
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
CwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTAyMjIxMjMxNDNaMC8GCSqGSIb3DQEJ
BDEiBCBcj75dmdk9Hb1QALkQOQcEKFXX20LP+YuQvUV1wDdBMjBsBgkqhkiG9w0BCQ8xXzBd
MAsGCWCGSAFlAwQBKjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCA
MA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMHAGCSsGAQQBgjcQBDFj
MGEwVTELMAkGA1UEBhMCREUxFzAVBgNVBAoMDkZyYXVuaG9mZXIgU0lUMS0wKwYDVQQDDCRW
b2xrc3ZlcnNjaGx1ZXNzZWx1bmcgUHJpdmF0ZSBDQSBHMDICCGRFBiAAmYjgMHIGCyqGSIb3
DQEJEAILMWOgYTBVMQswCQYDVQQGEwJERTEXMBUGA1UECgwORnJhdW5ob2ZlciBTSVQxLTAr
BgNVBAMMJFZvbGtzdmVyc2NobHVlc3NlbHVuZyBQcml2YXRlIENBIEcwMgIIZEUGIACZiOAw
DQYJKoZIhvcNAQEBBQAEggGApbQ++wTjFcfL0Ty9w8aDRIouVPDfstdg8byC3pTAOHARl4fw
kaNMFxIH1CbmUnNCTvbQfHXnUxf80aO+nMoBTQ6kt80NJizwNlX0+Acrq9r2IsgttQ7R+3Gc
EhJ3jAwgaPe1wvojHU4uEErIMOnAZteZ1Gwbr/TgKobM6Z4kk5nmfclWRCsZVitk0g4JZKmw
iBGVvaeVVujrIb3dL0GF1mQBgbWFosfKb7wv341ZOhWcfqD5ragpoF07mEGk/pQ8KjgZzQjw
eI6Dfkkrox3l77TwYmGrg20ItpzXIPqnwZE7qzX7l4ZvbPVxncBdmj4M9BC8c+SORWkm2w7p
WQ5jyXiB/2Sxtph6Tvs6uGlzJsAjk9ZgXGmmXr5+kUrQziyFAOGgyzB7MrMZ5e4OkHMFZmcL
1fTrGyhM+vfhrRHuQnBF6mvf2uClMKqXvILlNDkvjaeIlHJgkUQKz2lYKTa5NBDzkuQcBIZz
neZsPl/g1VFdEQkd1HhEiMUPTzThaVQ0AAAAAAAA
--------------ms020304000803090408030301--
